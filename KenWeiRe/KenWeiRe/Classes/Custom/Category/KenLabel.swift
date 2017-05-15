//
//  KenLabel.swift
//  KenWeiRe
//
//  Created by Ken.Liu on 2017/5/15.
//  Copyright © 2017年 Ken.Liu. All rights reserved.
//

import UIKit

extension UILabel {
    open class func labelWithText(_ text: String, frame: CGRect, font: UIFont, color: UIColor?) -> UILabel {
        let label = UILabel(frame: frame)
        label.backgroundColor = UIColor.clear
        label.text = text;
        label.font = font;
        if color == nil {
            label.textColor = UIColor.white
        } else {
            label.textColor = color
        }
        
        return label
    }
}
