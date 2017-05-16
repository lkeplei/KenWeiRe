//
//  KenUserDM.swift
//  KenWeiRe
//
//  Created by Ken.Liu on 2017/5/15.
//  Copyright © 2017年 Ken.Liu. All rights reserved.
//

import Foundation
import RealmSwift

class KenUserDM : Object {
    dynamic var userID = 0
    dynamic var name = ""
    dynamic var avatar = ""
    dynamic var desc = ""
    
    override static func primaryKey() -> String? {
        return "userID"
    }
}
