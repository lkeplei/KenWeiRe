//
//  KenAboutVC.swift
//  KenWeiRe
//
//  Created by Ken.Liu on 2017/5/12.
//  Copyright © 2017年 Ken.Liu. All rights reserved.
//

import UIKit
import SnapKit

class KenAboutVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNavitemTitle("关于我们")
        
        let iConImgV = UIImageView(image: UIImage(named: "mine_about_iCon"))
        iConImgV.center = CGPoint(x: self.contentView.center.x, y: 70 + iConImgV.height / 2)
        self.contentView.addSubview(iConImgV)
        
        let versionV = UIView(frame: CGRect(x: 0, y: iConImgV.bottom + 40, width: self.contentView.width, height: 40))
        versionV.backgroundColor = UIColor.white
        self.contentView.addSubview(versionV)
        
        let versionTL = UILabel.labelWithText("版本号",
                                             frame: CGRect(x: 10, y: 0, width: versionV.width, height: 40),
                                             font: UIFont.appFont(15), color: UIColor.appBlackTextColor)
        versionV.addSubview(versionTL)

        let versionL = UILabel.labelWithText(appVersion as! String,
                                             frame: CGRect(x: -10, y: 0, width: versionV.width, height: 40),
                                             font: UIFont.appFont(15), color: UIColor.appBlackTextColor)
        versionL.textAlignment = .right
        versionV.addSubview(versionL)
    }
}
