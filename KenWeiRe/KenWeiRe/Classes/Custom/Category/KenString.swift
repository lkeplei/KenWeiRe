//
//  KenString.swift
//  SwiftTest
//
//  Created by Ken.Liu on 2017/5/2.
//  Copyright © 2017年 Ken.Liu. All rights reserved.
//

import Foundation

extension String {
    
    func dateFromString(_ str: String, format: String) -> NSDate {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current // 设置时区
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: str)! as NSDate
    }
    
    func subString(to: Int) -> String {
        let index = self.index(self.startIndex, offsetBy: to)
        return self.substring(to: index)
    }

    func subString(from: Int) -> String {
        let index = self.index(self.startIndex, offsetBy: from)
        return self.substring(from: index)
    }
    
    func subEndString(to: Int) -> String {
        let index = self.index(self.endIndex, offsetBy: -to)
        return self.substring(from: index)
    }
    
    func subEndString(from: Int) -> String {
        let index = self.index(self.endIndex, offsetBy: -from)
        return self.substring(to: index)
    }
}
