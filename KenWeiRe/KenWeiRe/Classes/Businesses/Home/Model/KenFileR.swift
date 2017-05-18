//
//  KenFileR.swift
//  KenWeiRe
//
//  Created by Ken.Liu on 2017/5/17.
//  Copyright © 2017年 Ken.Liu. All rights reserved.
//

import Foundation
import RealmSwift

class KenFileR : Object {
    dynamic var userID = 0                              //拥有者，id
    dynamic var duration = 0                            //文件时长
    dynamic var type = 0                                //文件类型，0、普通
    dynamic var createTime = ""                         //文件创建时间    yyy/MM/dd-HH:mm:ss
    dynamic var name = "未命名"                          //文件名
    dynamic var desc = ""                               //文件描述
    dynamic var path = ""                               //文件路径
    
    override static func primaryKey() -> String? {
        return "createTime"
    }
}
