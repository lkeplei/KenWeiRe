//
//  KenLoginVC.swift
//  SwiftTest
//
//  Created by Ken.Liu on 2017/4/28.
//  Copyright © 2017年 Ken.Liu. All rights reserved.
//

import UIKit

class KenLoginVC: UIViewController {
    
    var loginBtn :UIButton = {
        let loginBtn = UIButton(type: .custom)
        loginBtn.frame = CGRect(x: 47, y: 200, width: ScreenW - 47 * 2, height: 44)
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.setTitleColor(UIColor.appWhiteTextColor, for: .normal)
        loginBtn.addTarget(self, action: #selector(login), for: .touchUpInside)
        loginBtn.backgroundColor = UIColor.appMainColor
        
        return loginBtn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.appBackgroundColor
        
        self.view.addSubview(loginBtn)
    }
    
    func login() {
        printLog("登录了")
        
        KenLoginS.loginWithName(name: "200", pwd: "1234567a") { (success: ObjCBool, errMsg: String, result: KenLoginDM?) in
            if success.boolValue {
                let delegate = UIApplication.shared.delegate as! AppDelegate
                delegate.window?.rootViewController = KenTabbarVC()
            } else {
                
            }
        }
    }
}
