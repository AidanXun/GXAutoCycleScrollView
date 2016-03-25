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
    
    private lazy var localImages1: [String] = ["images.bundle/1","images.bundle/2","images.bundle/3","images.bundle/4","images.bundle/5","images.bundle/6","images.bundle/7","images.bundle/8","images.bundle/9"]
    
    private var localImages2: [String] = ["http://h.hiphotos.baidu.com/zhidao/pic/item/b3fb43166d224f4a476e973308f790529822d11f.jpg", "http://g.hiphotos.baidu.com/zhidao/pic/item/03087bf40ad162d9ac9e92ce13dfa9ec8b13cdf4.jpg", "http://www.bz55.com/uploads/allimg/130614/1-1306140UT2.jpg", "http://imgsrc.baidu.com/forum/pic/item/121eb8014a90f60331fe82bf3912b31bb151ed1c.jpg", "http://y1.ifengimg.com/e7f199c1e0dbba14/2015/0401/rdn_551b8fcd7b0aa.jpg", "http://a.hiphotos.baidu.com/zhidao/pic/item/b3b7d0a20cf431ad43de9ea04936acaf2edd981f.jpg"]
    
    private lazy var scrollView1: GXCycleScrollView = {
        
        let view = GXCycleScrollView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height/2), localImages: self.localImages1)
        
        view.autoScrollTimeDelay = 2
        
        return view
    }()
    
    private lazy var scrollView2: GXCycleScrollView = {
        
        let view = GXCycleScrollView(frame: CGRectMake(0, UIScreen.mainScreen().bounds.height/2, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height/2), webImages: self.localImages2)
        
        view.autoScrollTimeDelay = 3
        
        return view
    }()
    

}

