//
//  KenVie.swift
//  SwiftTest
//
//  Created by Ken.Liu on 2017/5/2.
//  Copyright © 2017年 Ken.Liu. All rights reserved.
//

import UIKit

extension UIView {
    //视图宽
    open var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame.size.width = newValue
        }
    }
    
    //视图高
    open var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }
    
    //视图size
    open var size: CGSize {
        get {
            return self.frame.size
        }
        set {
            self.frame.size = newValue
        }
    }
    
    //最小 x 坐点
    open var left: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin.x = newValue
        }
    }
    
    //最大 x 坐点
    open var right: CGFloat {
        get {
            return self.frame.maxX
        }
        set {
            self.width = newValue - self.left
        }
    }
    
    //最小 y 坐点
    open var top: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin.y = newValue
        }
    }
    
    //最大 y 坐点
    open var bottom: CGFloat {
        get {
            return self.frame.origin.y + self.height
        }
        set {
            self.height = newValue - self.top
        }
    }
    
    //添加点击能力
    private static var clickGestureKey = "tap_gesture_key"
    private static var clickGestureActionKey = "tap_gesture_action_key"
    
    public func click(_ action: (_ view: UIView) -> ()) {
        var gesture = objc_getAssociatedObject(self, &UIView.clickGestureKey);
        
        if gesture == nil {
            gesture = UITapGestureRecognizer(target: self, action: #selector(actionTapGesture(gesture:)))
            
            self.isUserInteractionEnabled = true
            self.addGestureRecognizer(gesture as! UIGestureRecognizer)
            objc_setAssociatedObject(self, &UIView.clickGestureKey, gesture, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }

        objc_setAssociatedObject(self, &UIView.clickGestureActionKey, action, .OBJC_ASSOCIATION_COPY);
    }
    
    func actionTapGesture(gesture: UITapGestureRecognizer) {
        let action:(_ view: UIView) -> () = objc_getAssociatedObject(self, &UIView.clickGestureActionKey) as! (UIView) -> ();
        if gesture.state == UIGestureRecognizerState.recognized {
            action(self)
        }
    }
}
