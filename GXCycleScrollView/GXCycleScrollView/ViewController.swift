//
//  ViewController.swift
//  GXCycleScrollView
//
//  Created by Aidan on 16/3/19.
//  Copyright © 2016年 aidan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let kScreenW = UIScreen.mainScreen().bounds.width
    let kScreenH = UIScreen.mainScreen().bounds.height


    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
    
    }


    private func setUpUI() {
        
        view.addSubview(scrollView1)
        view.addSubview(scrollView2)
        
        
    }
    
    // 懒加载
    
    private lazy var localImages1: [UIImage] = {
    
        var images = [UIImage]()
        
        let temp = ["1","2","3","4","5","6","7","8","9"]
        
        for imageNamged in temp {
            
            let image = UIImage(named: imageNamged)
            images.append(image!)
        }

        return images
    }()

    private lazy var localImages2: [UIImage] = {
        
        var images = [UIImage]()
        
        let temp = ["10","11","12","13","14","15","16","17","18"]
        
        for imageNamged in temp {
            
            let image = UIImage(named: imageNamged)
            images.append(image!)
        }
        
        return images
    }()
    
    private lazy var scrollView1: GXCycleScrollView = {
        
        let view = GXCycleScrollView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height/2), images: self.localImages1)
        
        view.autoScrollTimeDelay = 3
        
        return view
    }()
    
    private lazy var scrollView2: GXCycleScrollView = {
        
        let view = GXCycleScrollView(frame: CGRectMake(0, UIScreen.mainScreen().bounds.height/2, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height/2), images: self.localImages2)
        
        view.autoScrollTimeDelay = 1.5
        
        return view
    }()
    

}

