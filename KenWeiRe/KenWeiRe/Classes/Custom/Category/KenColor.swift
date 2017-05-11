//
//  KenColor.swift
//  SwiftTest
//
//  Created by Ken.Liu on 2017/5/2.
//  Copyright © 2017年 Ken.Liu. All rights reserved.
//

import UIKit

extension UIColor {
    
    open class var appBlackTextColor :UIColor { return UIColor(value: 0x4E4E53, alpha: 1) }
    
    open class var appDarkGrayTextColor :UIColor { return UIColor(value: 0x999999, alpha: 1) }
    
    open class var appGrayTextColor :UIColor {return UIColor(value: 0xC1C1C1, alpha: 1)}
    
    open class var appLightGrayTextColor :UIColor {return UIColor(value: 0xDADADA, alpha: 1)}
    
    open class var appWhiteTextColor :UIColor {return UIColor(value: 0xFFFFFF, alpha: 1)}
    
    open class var appBackgroundColor :UIColor {return UIColor(value: 0xF6F6F6, alpha: 1)}
    
    open class var appSepLineColor :UIColor {return UIColor(value: 0xE2E2E2, alpha: 1)}
    
    open class var appLinkColor :UIColor {return UIColor(value: 0x00CAFF, alpha: 1)}
    
    open class var appMainColor :UIColor {return UIColor(value: 0x4CD645, alpha: 1)}
    
    convenience init(value: UInt, alpha: CGFloat) {
        self.init (
            red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((value & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(value & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
