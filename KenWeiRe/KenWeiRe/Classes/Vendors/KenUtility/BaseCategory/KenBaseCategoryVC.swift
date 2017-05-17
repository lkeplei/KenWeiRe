//
//  KenBaseCategoryVC.swift
//  SwiftTest
//
//  Created by Ken.Liu on 2017/5/2.
//  Copyright © 2017年 Ken.Liu. All rights reserved.
//

import UIKit

extension UIViewController {
    
    //扩展内容视图
    private static var vcContentViewKey = "vc_content_view_key"
    
    var contentView: UIView! {
        get {
            return objc_getAssociatedObject(self, &UIViewController.vcContentViewKey) as? UIView
        }
        set(newValue) {
            objc_setAssociatedObject(self, &UIViewController.vcContentViewKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func kenViewDidload() {
        self.kenViewDidload()
        
        self.automaticallyAdjustsScrollViewInsets = false           //关闭系统自动的下移功能(64)

        self.contentView = UIView(frame: CGRect(x: 0, y: 64, width: self.view.width, height: self.view.height - 64))
        self.contentView?.backgroundColor = UIColor.appBackgroundColor
        [self.view.addSubview(contentView)];
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

    func setNavitemTitle(_ title: String) {
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
            viewController.setLeftNavItemWithImg(image: UIImage(named: "ken_public_nav_back")!, selector: #selector(back))
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

