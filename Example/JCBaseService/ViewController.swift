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

class ViewController: JCBaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = .white

        self.resourceArr = JCRouterManager.shared.modules
        self.tableView.separatorStyle = .singleLine
        self.cellIdentifier = "UITableViewCell"
        self.cellModelBlock = { (cell, title) in
            let cell: UITableViewCell = cell
            cell.textLabel?.text = title as? String
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let title: String = resourceArr[indexPath.row] as? String ?? ""
        switch title {
        case "AModule":
            URLRouter.default.openRoute("AModule/homePage", parameters: ["id": 111, "name": "nero"])
        case "BModule":
            URLRouter.default.openRoute("BModule/homePage", parameters: ["id": 111, "name": "nero"])
        case "CModule":
            URLRouter.default.openRoute("CModule/homePage", parameters: ["id": 111, "name": "nero"])
        default:
            break
        }
    }
    
}
