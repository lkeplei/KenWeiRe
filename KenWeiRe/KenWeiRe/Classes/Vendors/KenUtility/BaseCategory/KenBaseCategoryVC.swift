//
//  KenBaseCategoryVC.swift
//  SwiftTest
//
//  Created by Ken.Liu on 2017/5/2.
//  Copyright © 2017年 Ken.Liu. All rights reserved.
//

import UIKit

extension UIViewController {
    func kenViewDidload() {
        self.kenViewDidload()
        
        self.view.backgroundColor = UIColor.appBackgroundColor
        self.automaticallyAdjustsScrollViewInsets = false           //关闭系统自动的下移功能(64)
        
        if ((self.navigationController?.viewControllers.count)! > 1) {
            self.navigationItem.hidesBackButton = true
            self.setLeftNavItemWithImg(image: UIImage(named: "ken_public_nav_back")!, selector: #selector(back))
        }
    }
    
    func setLeftNavItemWithImg(image: UIImage, selector: Selector) {
        self.setNavItemWithImg(image: image, selector: selector, left: true)
    }
    
    func setRightNavItemWithImg(image: UIImage, selector: Selector) {
        self.setNavItemWithImg(image: image, selector: selector, left: false)
    }
    
    func setNavItemWithImg(image: UIImage, selector: Selector, left: Bool) {
        let item = UIBarButtonItem(image: image, style: .plain, target: self, action: selector)
        if left {
            self.navigationItem.leftBarButtonItem = item
        } else {
            self.navigationItem.rightBarButtonItem = item
        }
    }

    func setNavitemTitle(title: String) {
        if title.isEmpty {
            self.navigationItem.title = ""
        } else {
            self.navigationItem.title = title
        }
    }
    
    open func back() -> UIViewController? {
        return self.popViewC(animated: true)
    }
    
    open func pushViewC(_ viewController: UIViewController, animated: Bool) {
        if self.navigationController != nil {
            self.navigationController?.pushViewController(viewController, animated: animated)
        }
    }
    
    open func popViewC(animated: Bool) -> UIViewController? {
        if self.navigationController != nil {
            return self.navigationController?.popViewController(animated: animated)
        } else {
            return nil
        }
    }
}

