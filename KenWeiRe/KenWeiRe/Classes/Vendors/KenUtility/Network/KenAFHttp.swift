//
//  KenAFHttp.swift
//  SwiftTest
//
//  Created by Ken.Liu on 2017/5/3.
//  Copyright © 2017年 Ken.Liu. All rights reserved.
//

import AFNetworking

class KenAFHttp {
    // let是线程安全的
    static let shareInstance :KenAFHttp = {
        let http = KenAFHttp()
        http.initManager()
        return http
    }()
    
    private let manager :AFHTTPSessionManager = {
        return AFHTTPSessionManager()
    }()
    
    private let httpRequest :AFHTTPRequestSerializer = {
        var request = AFHTTPRequestSerializer()
        request.timeoutInterval = 10
        let value = "{\"system\" : \"iOS\"," +
                    "\"uuid\" : \"\(UIDevice.deviceUuid())\"," +
                    "\"sysVersion\" : \"\(UIDevice.current.systemVersion)\"," +
                    "\"version\" : \"\(String(describing: appVersion))\"," +
                    "\"device\" : \"\(UIDevice.deviceModel())\"}"
        
        request.setValue(value, forHTTPHeaderField: "standardUA")
        return request
    }()
    
    private let jsonResponse :AFJSONResponseSerializer = {
        var response = AFJSONResponseSerializer()
        response.acceptableContentTypes?.insert("application/json")
        response.acceptableContentTypes?.insert("text/json")
        response.acceptableContentTypes?.insert("text/javascript")
        response.acceptableContentTypes?.insert("text/html")
        response.acceptableContentTypes?.insert("text/plain")
        return response
    }()
    
    private func initManager() {
        //设置非校验证书模式
        self.manager.securityPolicy = AFSecurityPolicy(pinningMode :.none)
        self.manager.securityPolicy.allowInvalidCertificates = true
        self.manager.securityPolicy.validatesDomainName = false
        
        self.manager.requestSerializer = self.httpRequest
        self.manager.responseSerializer = self.jsonResponse
    }
    
    open func post(_ url: String, parameters: [String:String], success: ((_ success :ObjCBool, _ result :NSDictionary?) -> Swift.Void)?,
              failure: ((URLSessionDataTask?, Error) -> Swift.Void)? = nil) {
        
        var params = parameters
        params["token"] = ""
        
        self.manager.post(url, parameters: params, progress: { (progress :Progress) in
            
        }, success: { (task :URLSessionDataTask, result :Any?) in
            let dic = result as? NSDictionary
            if dic?["code"] as! String == "100" {
                success!(true, dic?["data"] as! NSDictionary?)
            } else {
                success!(false, nil)
            }
        }) { (task :URLSessionDataTask?, error :Error) in
            failure!(nil, (error as NSError?)!)
        }
    }
}
