//
//  KenLoginS.swift
//  SwiftTest
//
//  Created by Ken.Liu on 2017/5/3.
//  Copyright © 2017年 Ken.Liu. All rights reserved.
//

import Foundation
import HandyJSON

class KenLoginS {
    class func loginWithName(name: String, pwd: String,
                             response: ((_ success: ObjCBool, _ errMsg: String,  _ result: KenLoginDM?) -> Swift.Void)?) {
        
        KenAFHttp.shareInstance.post("http://dev.izhuan365.com:20340/user/login",
                                     parameters: ["password":pwd, "username":name],
                                     success: { (_ success :ObjCBool, _ result :NSDictionary?) in
                                        if success.boolValue {
                                            response!(true, "", KenLoginDM.deserialize(from: result))
                                        } else {
                                            response!(false, "数据异常", nil)
                                        }
        }) { (task: URLSessionDataTask?, error: Error) in
            response!(false, error.localizedDescription, nil)
        }
    }
}
