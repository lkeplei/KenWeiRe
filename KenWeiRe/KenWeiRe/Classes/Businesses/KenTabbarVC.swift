//
//  KenTabbarVC.swift
//  SwiftTest
//
//  Created by Ken.Liu on 2017/4/28.
//  Copyright © 2017年 Ken.Liu. All rights reserved.
//

import UIKit

class KenTabbarVC: UITabBarController {
    var tabbarVC = KenTabBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupChileVC()
        
        self.setupTabBar()
    }
    
    
    // 移除系统自带的tabbar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.backgroundColor = UIColor.white
        for child in self.tabBar.subviews {
            if child.isKind(of: UIControl.self) {
                child.removeFromSuperview()
            }
        }
    }
    
    // 自定义tabbar覆盖系统的tabbar
    func setupTabBar(){
        tabbarVC.frame = self.tabBar.bounds
        tabbarVC.backgroundColor = UIColor.clear
        self.tabBar.addSubview(tabbarVC)
        tabbarVC.SelectedTabbar = { (fromIndex:Int,toIndex:Int) in
            self.selectedIndex = NSInteger(toIndex)
        }
    }
    
    // MARK:- 设置基本框架
    func setupChileVC() {
        let homeVC = KenHomeVC()
        self.addChildViewController(homeVC, title: "录音", image: "ken_tab_home_normal", selectedImage: "ken_tab_home_hl")
        
        let fileManagerVC = KenFileManagerVC()
        self.addChildViewController(fileManagerVC, title: "文件管理", image: "ken_tab_file_normal", selectedImage: "ken_tab_file_hl")
        
        let news = KenMineVC()
        self.addChildViewController(news, title: "我的",image: "ken_tab_user_normal", selectedImage: "ken_tab_user_hl")
    }
    
    func addChildViewController(_ viewController:UIViewController,title:String,image:String,selectedImage:String) {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = UIImage(named: image)
        viewController.tabBarItem.selectedImage = UIImage(named: selectedImage)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)

        self.addChildViewController(UINavigationController.init(rootViewController: viewController))
        viewController.setNavitemTitle(title)
        
        tabbarVC.addCustomButtonWithitem(viewController.tabBarItem)
    }
}
