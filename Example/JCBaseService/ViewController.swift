//
//  ViewController.swift
//  JCBaseService
//
//  Created by zk1947@163.com on 04/15/2024.
//  Copyright (c) 2024 zk1947@163.com. All rights reserved.
//

import UIKit
import JCBaseService
import SnapKit
import AModule

class ViewController: JCBaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = .white
        
        self.resourceArr = ["路由跳转","路由带回调","路由重定向"]
        self.tableView.separatorStyle = .singleLine
        self.cellIdentifier = "UITableViewCell"
        self.cellModelBlock = { (cell, title) in
            let cell: UITableViewCell = cell
            cell.textLabel?.text = title as? String
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let title: String = resourceArr[indexPath.row] as! String
        switch title {
        case "路由跳转":
            URLRouter.default.openRoute("AModule/homePage", parameters: ["id": 111, "name": "nero"])
        case "路由带回调":
            let result = URLRouter.default.openRoute("BModule/homePage", parameters: ["id": 222, "name": "nero"]) { body in
                JCLog("回调参数 == \(String(describing: body))")
            }
        case "路由重定向":
            let routeMap = ["BModule/homePage" : "BModule/listPage"]
            URLRouter.default.routeRedirector.updateRedirectRoutes(routeMap)
            URLRouter.default.openRoute("BModule/homePage", parameters: [:])
        default:
            break
        }
    }
    
}

