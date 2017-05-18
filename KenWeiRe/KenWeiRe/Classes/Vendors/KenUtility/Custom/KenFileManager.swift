//
//  KenFileManager.swift
//  KenWeiRe
//
//  Created by Ken.Liu on 2017/5/18.
//  Copyright © 2017年 Ken.Liu. All rights reserved.
//

import UIKit

class KenFileManager {
    open class func documentDirectory() -> String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    }
    
    open class func cachesDirectory() -> String {
        return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
    }
    
    open class func libraryDirectory() -> String {
        return NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]
    }
    
    //创建文件夹
    open class func createFolderWithPath(_ path: String) {
        let fileManager = FileManager.default
        try! fileManager.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
    }
    
    //获取目录下所有文件
    open class func contentsOfDirectory(_ path: String) -> [String] {
        let fileManager = FileManager.default
        return try! fileManager.contentsOfDirectory(atPath: path)
    }
    
    //判断文件是否存在
    open class func fileExistsAtPath(_ path: String) -> Bool {
        let fileManager = FileManager.default
        return fileManager.fileExists(atPath: path)
    }
}
