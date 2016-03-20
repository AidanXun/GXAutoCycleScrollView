//
//  GXCycleScrollView.swift
//  GXCycleScrollView
//
//  Created by Aidan on 16/3/20.
//  Copyright © 2016年 aidan. All rights reserved.
//

import UIKit

class GXCycleScrollView: UIScrollView {
    
    private var timer: NSTimer?
    
    private var currentIndex: Int = 0
    
    private var maxImageCount: Int = 0
    
    var autoScrollTimeDelay: NSTimeInterval? {
        didSet {
            
            if autoScrollTimeDelay > 0 {
                self.removeTimer()
                self.setUpTimer()
            }
        }
    }

    private var localImages: [UIImage]?
    
    convenience init(frame: CGRect, images: [UIImage]?) {
        self.init(frame: frame)
        
        localImages = images
        maxImageCount = (images?.count)!
        setUpUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUpUI() {
        
        delegate = self
        contentSize = CGSizeMake(bounds.width * 3, 0)
        bounces = false
        pagingEnabled = true
        showsHorizontalScrollIndicator = false
        
        
        addSubview(leftImageView)
        addSubview(midImageView)
        addSubview(rightImageView)

        setImage(self.maxImageCount - 1, midImageIndex: 0, rightImageIndex: 1)
    }
    
    // MARK: - 懒加载
    
    private lazy var leftImageView: UIImageView = {
        let leftImageView = UIImageView(frame: CGRectMake(0, 0, self.bounds.width, self.bounds.height))
        leftImageView.backgroundColor = UIColor.redColor()
        
        return leftImageView
    }()

    private lazy var midImageView: UIImageView = {
        let midImageView = UIImageView(frame: CGRectMake(self.bounds.width, 0, self.bounds.width, self.bounds.height))
        midImageView.backgroundColor = UIColor.blueColor()
        
        return midImageView
    }()
    
    private lazy var rightImageView: UIImageView = {
        let rightImageView = UIImageView(frame: CGRectMake(self.bounds.width * 2, 0, self.bounds.width, self.bounds.height))
        rightImageView.backgroundColor = UIColor.yellowColor()
        
        return rightImageView
    }()
    
}

// MARK: - 显示图片相关方法
extension GXCycleScrollView {
    
    private func setImage(leftImageIndex: Int, midImageIndex: Int, rightImageIndex: Int) {
        
        
        leftImageView.image = localImages![leftImageIndex]
        midImageView.image = localImages![midImageIndex]
        rightImageView.image = localImages![rightImageIndex]
        
        setContentOffset(CGPoint(x: bounds.width, y: 0), animated: false)
    }
    
    private func changePage(offsetX: CGFloat) {
        
        if offsetX >= bounds.width * 2 {
            
            currentIndex++
            
            if currentIndex == maxImageCount - 1 {
                
                setImage(currentIndex - 1, midImageIndex: currentIndex, rightImageIndex: 0)
            } else if currentIndex == maxImageCount {
                
                currentIndex = 0
                setImage(maxImageCount - 1, midImageIndex: currentIndex, rightImageIndex: currentIndex + 1)
            } else {
                
                setImage(currentIndex - 1, midImageIndex: currentIndex, rightImageIndex: currentIndex + 1)
            }
        }
        
        if offsetX <= 0 {
            
            currentIndex--
            
            if currentIndex == 0 {
                
                setImage(maxImageCount - 1, midImageIndex: currentIndex, rightImageIndex: currentIndex + 1)
            } else if currentIndex == -1 {
                
                currentIndex = maxImageCount - 1
                setImage(currentIndex - 1, midImageIndex: currentIndex, rightImageIndex: 0)
            } else {
                
                setImage(currentIndex - 1, midImageIndex: currentIndex, rightImageIndex: currentIndex + 1)
            }
        }
    }
    
    func autoScroll() {
        
        setContentOffset(CGPoint(x: bounds.width * 2, y: 0), animated: true)
    }
}



// MARK: - UIScrollViewDelegate
extension GXCycleScrollView: UIScrollViewDelegate {
    
    @objc func scrollViewDidScroll(scrollView: UIScrollView) {
        
        changePage(scrollView.contentOffset.x)
        print(scrollView.contentOffset.x)
    }
    
    @objc func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        setUpTimer()
    }
    
    @objc func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
        removeTimer()
    }
    
}

// MARK: - 定时器相关代码
extension GXCycleScrollView {
    
    
    private func setUpTimer() {
        
        if autoScrollTimeDelay > 0 {
        
            timer = NSTimer.scheduledTimerWithTimeInterval(autoScrollTimeDelay!, target: self, selector: "autoScroll", userInfo: nil, repeats: true)
        
            NSRunLoop.currentRunLoop().addTimer(timer!, forMode: NSRunLoopCommonModes)
        }
    }
    
    private func removeTimer() {
        
        if let t = timer {
            t.invalidate()
        }
    }
    
}


