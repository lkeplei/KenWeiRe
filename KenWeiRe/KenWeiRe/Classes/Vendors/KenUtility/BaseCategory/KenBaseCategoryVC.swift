//
//  KenBaseCategoryVC.swift
//  SwiftTest
//
//  Created by Ken.Liu on 2017/5/2.
//  Copyright © 2017年 Ken.Liu. All rights reserved.
//

import UIKit

extension UIViewController {
    func setNavitemTitle(title: String) {
        if title.isEmpty {
            self.navigationItem.title = ""
        } else {
            self.navigationItem.title = title
        }
    }
}

