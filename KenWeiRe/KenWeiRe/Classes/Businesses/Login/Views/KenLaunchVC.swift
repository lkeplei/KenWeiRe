//
//  KenLaunchVC.swift
//  SwiftTest
//
//  Created by Ken.Liu on 2017/5/2.
//  Copyright © 2017年 Ken.Liu. All rights reserved.
//

import UIKit

class KenLaunchVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let delegate = UIApplication.shared.delegate as! AppDelegate
//        delegate.window?.rootViewController = KenLoginVC()
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        delegate.window?.rootViewController = KenTabbarVC()
    }
}
