//
//  KenBaseNavVC.swift
//  KenWeiRe
//
//  Created by Ken.Liu on 2017/5/12.
//  Copyright © 2017年 Ken.Liu. All rights reserved.
//

import UIKit

extension UINavigationController {
    func kenPushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true      // 如果push进来的不是第一个控制器,隐藏tabbar
        }
        
        self.kenPushViewController(viewController, animated: animated)
    }
}
