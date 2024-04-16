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
        
        self.resourceArr = ["加载图标","测试2"]
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
        case "加载图标":
            let vc = JCAModuleHomeController()
            jc_push(vc)
        default:
            break
        }
    }
    
}

