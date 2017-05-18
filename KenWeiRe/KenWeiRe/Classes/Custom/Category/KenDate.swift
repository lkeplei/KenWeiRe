//
//  KenDate.swift
//  KenWeiRe
//
//  Created by Ken.Liu on 2017/5/18.
//  Copyright © 2017年 Ken.Liu. All rights reserved.
//

import Foundation

extension NSDate {
    
    func toString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current // 设置时区
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self as Date)
    }
    
}
