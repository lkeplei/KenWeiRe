//
//  KenAlertController.swift
//  KenWeiRe
//
//  Created by Ken.Liu on 2017/5/17.
//  Copyright © 2017年 Ken.Liu. All rights reserved.
//

import UIKit

class KenAlertController {
    class func showAlertWithTitle(_ title: String, message: String, btnTitles: [String], action: @escaping (_ index: Int) -> ()) {
        KenAlertController.showWithTitle(title, message: message, btnTitles: btnTitles, type: .alert, action: action)
    }
    
    class func showActionsheetWithTitle(_ title: String, message: String, btnTitles: [String], action: @escaping (_ index: Int) -> ()) {
        KenAlertController.showWithTitle(title, message: message, btnTitles: btnTitles, type: .actionSheet, action: action)
    }
    
    class func showWithTitle(_ title: String, message: String, btnTitles: [String], type: UIAlertControllerStyle,
                             action: @escaping (_ index: Int) -> ()) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: type)
        
        for i in 0..<btnTitles.count {
            let btnAction = UIAlertAction(title: btnTitles[i], style: .default, handler: {
                (btnAction: UIAlertAction) -> Void in
                action(i)
            })
            alertVC.addAction(btnAction)
        }
        
        KenAlertController.topViewController()?.present(alertVC, animated: true, completion: nil)
    }
    
    private class func topViewController() -> UIViewController? {
        var resultViewController: UIViewController? = nil
        // 多window的情况下， 需要对window进行有效选择选择
        if let rootViewController = UIApplication.shared.keyWindow?.rootViewController {
            resultViewController = __topViewController(rootViewController)
            while resultViewController?.presentedViewController != nil {
                resultViewController = resultViewController?.presentedViewController
            }
        }
        return resultViewController
    }
    
    private class func __topViewController(_ object: AnyObject!) -> UIViewController? {
        if let navigationController = object as? UINavigationController {
            return __topViewController(navigationController.viewControllers.last)
        }
        else if let tabBarController = object as? UITabBarController {
            if tabBarController.selectedIndex < (tabBarController.viewControllers?.count)! {
                return __topViewController(tabBarController.viewControllers![tabBarController.selectedIndex])
            }
        }
        else if let vc = object as? UIViewController {
            return vc  
        }  
        
        return nil  
    }
}
