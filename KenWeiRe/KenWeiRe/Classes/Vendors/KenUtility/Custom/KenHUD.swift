//
//  KenHUD.swift
//  KenWeiRe
//
//  Created by Ken.Liu on 2017/5/15.
//  Copyright © 2017年 Ken.Liu. All rights reserved.
//

import UIKit
import SVProgressHUD

class KenHUD: SVProgressHUD, SelfAware {
    
    static func awake() {
        self.setupInnitial()
    }
    
    static func setupInnitial(){
        self.setSuccessImage(UIImage(named: "ken_hud_success"))
        self.setInfoImage(UIImage(named: "ken_hud_info"))
        self.setErrorImage(UIImage(named: "ken_hud_error"))
        self.setDefaultStyle(.dark)
        self.setDefaultMaskType(.clear)
        self.setCornerRadius(6.0)
        self.setBackgroundColor(UIColor(white: 0, alpha: 0.4))
    }
    
    /**
     *  显示纯文本 加一个转圈
     *
     *  @param aText 要显示的文本
     */
    static func kenShowText(text: String, duration: Double = 4) {
        SVProgressHUD.show(withStatus: text)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(duration * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
            SVProgressHUD.dismiss()
        }
    }
    
    /**
     *  显示错误信息
     *
     *  @param aText 错误信息文本
     */
    static func kenShowErrorText(text: String, duration: Double = 4) {
        SVProgressHUD.showError(withStatus: text)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(duration * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
            SVProgressHUD.dismiss()
        }
    }
    /**
     *  显示成功信息
     *
     *  @param aText 成功信息文本
     */
    static func kenShowSuccessText(text: String, duration: Double = 4) {
        SVProgressHUD.showSuccess(withStatus: text)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(duration * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
            SVProgressHUD.dismiss()
        }
    }
    
    /**
     *  只显示一个加载框
     */
    static func kenShowLoading(title: String = "加载中...") {
        SVProgressHUD.show(withStatus: title)
    }
    
    static func kenDismissLoading(){
        SVProgressHUD.dismiss()
    }
    
    static func kenShowProgress(progress: Float) {
        SVProgressHUD.showProgress(progress / 100.0, status: "")
    }
    
    static func kenShowImage(image: UIImage, text: String) {
        self.setDefaultAnimationType(.flat)
        
        SVProgressHUD.show(image, status: text)
    }
}
