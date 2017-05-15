//
//  KenMineVC.swift
//  SwiftTest
//
//  Created by Ken.Liu on 2017/4/28.
//  Copyright © 2017年 Ken.Liu. All rights reserved.
//

import UIKit

class KenMineVC: UIViewController {
    fileprivate let dataArray = [["image":"mine_appraise", "title":"给我评分"],
                                 ["image":"mine_contact", "title":"联系我们"],
                                 ["image":"mine_about_us", "title":"关于我们"]]
    
    fileprivate lazy var tableView :UITableView = {
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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.contentView.addSubview(tableView)
    }
    
    func tableHeaderV() -> UIView {
        let headerV = UIView(frame: CGRect(x: 0, y: 0, width: self.contentView.width, height: 120))
        headerV.backgroundColor = UIColor.appBackgroundColor
        
        let userV = UIView(frame: CGRect(x: 0, y: 10, width: headerV.width, height: 100))
        userV.backgroundColor = UIColor.white
        headerV.addSubview(userV)
        
        return headerV
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
