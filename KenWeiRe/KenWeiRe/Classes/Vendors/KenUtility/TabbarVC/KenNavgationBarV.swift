//
//  KenNavgationBarV.swift
//  SwiftTest
//
//  Created by Ken.Liu on 2017/4/28.
//  Copyright © 2017年 Ken.Liu. All rights reserved.
//

import UIKit

class KenNavgationBarV: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.titleLable)
        self.addSubview(self.navLine)
        self.backgroundColor = UIColor(red: 199 / 255.0, green: 52 / 255.0, blue: 45 / 255.0, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate lazy var titleLable:UILabel = {
        let titleLable = UILabel()
        titleLable.textAlignment = .center
        titleLable.textColor = UIColor.white
        titleLable.font = UIFont.systemFont(ofSize: 17)
        return titleLable;
    }()
    fileprivate lazy var navLine:UILabel = {
        let navLine = UILabel()
        navLine.backgroundColor = UIColor.gray
        return navLine;
    }()
    
    override func layoutSubviews() {
        self.titleLable.frame = CGRect(x: 0, y: 20, width: ScreenW, height: 64-20);
        self.navLine.frame = CGRect(x: 0, y: 64, width: ScreenW, height: 0.26);
    }
}
