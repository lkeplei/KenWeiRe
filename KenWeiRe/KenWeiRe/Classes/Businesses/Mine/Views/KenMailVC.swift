//
//  KenMailVC.swift
//  KenWeiRe
//
//  Created by Ken.Liu on 2017/5/15.
//  Copyright © 2017年 Ken.Liu. All rights reserved.
//

import UIKit
import MessageUI

class KenMailVC: UIViewController ,UINavigationControllerDelegate, MFMailComposeViewControllerDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNavitemTitle("联系我们")
        
        //首先要判断设备具不具备发送邮件功能
        if MFMailComposeViewController.canSendMail(){
            let controller = MFMailComposeViewController()
            //设置代理
            controller.mailComposeDelegate = self
            //设置主题
            controller.setSubject("我是邮件标题")
            //设置收件人
            controller.setToRecipients(["a1@hangge.com","a2@hangge.com"])
            //设置抄送人
            controller.setCcRecipients(["b1@hangge.com","b2@hangge.com"])
            //设置密送人
            controller.setBccRecipients(["c1@hangge.com","c2@hangge.com"])
            
            //添加图片附件
            let path = Bundle.main.path(forResource: "hangge.png", ofType: "")
            let url = URL(fileURLWithPath: path!)
            let myData = try! Data(contentsOf: url)
            controller.addAttachmentData(myData, mimeType: "image/png", fileName: "swift.png")
            
            //设置邮件正文内容（支持html）
            controller.setMessageBody("我是邮件正文", isHTML: false)
            
            //打开界面
            self.present(controller, animated: true, completion: nil)
        } else {
            printLog("本设备不能发送邮件")
            KenHUD.kenShowText(text: "本设备不能发送邮件")
        }
    }
    
    //发送邮件代理方法
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
        
        switch result{
            case .sent:
                printLog("邮件已发送")
            case .cancelled:
                printLog("邮件已取消")
            case .saved:
                printLog("邮件已保存")
            case .failed:
                printLog("邮件发送失败")
        }
    }
}
