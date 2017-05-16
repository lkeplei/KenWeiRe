//
//  KenMineVC.swift
//  SwiftTest
//
//  Created by Ken.Liu on 2017/4/28.
//  Copyright © 2017年 Ken.Liu. All rights reserved.
//

import UIKit
import RealmSwift

class KenMineVC: UIViewController {
    //使用默认的数据库
    let realm = try! Realm()
    
    let userInfo: KenUserDM = {
        let userInfo: KenUserDM
        
        let userItems = try! Realm().objects(KenUserDM.self)
        if userItems.count > 0 {
            userInfo = KenUserDM()
            userInfo.userID = 0
            userInfo.name = userItems[0].name
            userInfo.desc = userItems[0].desc
        } else {
            userInfo = KenUserDM()
            userInfo.userID = 0
            userInfo.name = "无名氏"
            userInfo.desc = "写点什么吧"
        }
        
        return userInfo
    }()
    
    fileprivate let dataArray = [["image":"mine_appraise", "title":"给我评分"],
                                 ["image":"mine_contact", "title":"联系我们"],
                                 ["image":"mine_about_us", "title":"关于我们"]]
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView(frame:CGRect(x: 0, y: 0, width: self.contentView.width, height: self.contentView.height),
                                    style: UITableViewStyle.grouped)
        tableView.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.showsVerticalScrollIndicator = false
        tableView.tableHeaderView = self.tableHeaderV()
        
        return tableView
    }()
    
    private let nameTextFeild: UITextField = {
        let nameTextFeild = UITextField(frame:CGRect(x: 100, y: 10, width: 200, height: 40))
        
        nameTextFeild.font = UIFont.appFont(16)
        nameTextFeild.borderStyle = .none
        nameTextFeild.textColor = UIColor.appBlackTextColor
        nameTextFeild.isEnabled = false
        
        return nameTextFeild
    }()
    
    private let descTextFeild: UITextField = {
        let descTextFeild = UITextField(frame:CGRect(x: 100, y: 50, width: 200, height: 24))
        
        descTextFeild.font = UIFont.appFont(14)
        descTextFeild.borderStyle = .none
        descTextFeild.textColor = UIColor.appLightGrayTextColor
        descTextFeild.isEnabled = false
        
        return descTextFeild
    }()
    
    private let editBtn: UIButton = {
        let editBtn = UIButton(type: .custom)
        editBtn.frame = CGRect(x: 0, y: 0, width: 60, height: 40)
        editBtn.setTitle("编辑", for: .normal)
        editBtn.setTitleColor(UIColor.appMainColor, for: .normal)
        editBtn.titleLabel?.font = UIFont.appFont(14)
        editBtn.addTarget(self, action: #selector(editBtnClicked), for: .touchUpInside)
        editBtn.backgroundColor = UIColor.clear
        
        return editBtn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.contentView.addSubview(tableView)
    }
    
    func tableHeaderV() -> UIView {
        let headerV = UIView(frame: CGRect(x: 0, y: 0, width: self.contentView.width, height: 110))
        headerV.backgroundColor = UIColor.appBackgroundColor
        
        let userV = UIView(frame: CGRect(x: 0, y: 10, width: headerV.width, height: 90))
        userV.backgroundColor = UIColor.white
        headerV.addSubview(userV)
        
        let avatar = UIImageView(image: UIImage(named: "mine_add"))
        avatar.left = 15
        avatar.center.y = userV.height / 2
        userV.addSubview(avatar)
        
        nameTextFeild.text = userInfo.name
        nameTextFeild.left = avatar.right + 15
        descTextFeild.text = userInfo.desc
        descTextFeild.left = nameTextFeild.left
        
        userV.addSubview(nameTextFeild)
        userV.addSubview(descTextFeild)
        
        editBtn.left = userV.width - editBtn.width - 10
        userV.addSubview(editBtn)
        
        return headerV
    }
    
    func editBtnClicked() {
        if nameTextFeild.isEnabled {
            userInfo.name = nameTextFeild.text!
            userInfo.desc = descTextFeild.text!
            
            nameTextFeild.isEnabled = false
            descTextFeild.isEnabled = false
            
            // 通过 id 更新该书籍
            try! realm.write {
                realm.add(userInfo, update: true)
            }
            
            editBtn.setTitle("编辑", for: .normal)
        } else {
            nameTextFeild.isEnabled = true
            descTextFeild.isEnabled = true
            
            nameTextFeild.becomeFirstResponder()
            editBtn.setTitle("完成", for: .normal)
        }
    }
}

//MARK: - UITableViewDelegate,UITableViewDataSource
extension KenMineVC:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ID = "cellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: ID)
        if cell == nil {
            cell = UITableViewCell(style: .`default`, reuseIdentifier: ID)
            cell?.contentView.backgroundColor = UIColor.white
            cell?.accessoryType = .disclosureIndicator
        }

        cell?.imageView?.image = UIImage(named: dataArray[indexPath.row]["image"]!)
        cell?.textLabel?.text = dataArray[indexPath.row]["title"]

        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.gotoAppStore()
        } else if indexPath.row == 1 {
            self.pushViewC(KenMailVC(), animated: true)
        } else if indexPath.row == 2 {
            self.pushViewC(KenAboutVC(), animated: true)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    private func gotoAppStore() {
        let urlString = "itms-apps://itunes.apple.com/app/id444934666"
        let url = NSURL(string: urlString)
        UIApplication.shared.openURL(url! as URL)
    }
}
