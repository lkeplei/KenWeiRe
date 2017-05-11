//
//  KenConfigConst.swift
//  SwiftTest
//
//  Created by Ken.Liu on 2017/4/28.
//  Copyright © 2017年 Ken.Liu. All rights reserved.
//

import UIKit

let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"]      // 获取App的版本
let appBuildVersion = Bundle.main.infoDictionary?["CFBundleVersion"]            // 获取App的build版本
let appName = Bundle.main.infoDictionary?["CFBundleDisplayName"]                // 获取App的名称

/// 项目基础配置
let ScreenW = UIScreen.main.bounds.size.width
/// 屏幕的高
let ScreenH = UIScreen.main.bounds.size.height


//==================  通知都写在这  ===================================
let ChangeMainVCContentEnable = "ChangeMainVCContentEnable"
let refreshIsDidEnd = "refreshIsDidEnd"  //tabbar 结束刷新
let refreshBegin = "refreshBegin"  // tabbar开始刷新
let RotationIconBeginRotation = "RotationIconBeginRotation"  // tabbar刷新的通知


/// 输出日志
///
/// - parameter message:  日志消息
/// - parameter logError: 错误标记，默认是false,如果是true,发布时仍然会输出
/// - parameter file:     文件名
/// - parameter method:   方法名
/// - parameter line:     代码行数
func printLog<T>(_ message: T, logError: Bool = false, file: String = #file, method: String = #function, line: Int = #line) {
    if logError {
        print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    } else {
        #if DEBUG
            print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
        #endif
    }
}
