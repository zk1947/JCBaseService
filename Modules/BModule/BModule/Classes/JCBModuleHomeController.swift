//
//  JCBModuleHomeController.swift
//  AModule
//
//  Created by 赵凯 on 2024/4/16.
//

import UIKit

class JCBModuleHomeController: JCBaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setTitle(title: "B模块")
        
        self.resourceArr = ["路由跳转","路由带回调","路由跳Html","路由重定向", "路由拦截器"]
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
            _ = URLRouter.default.openRoute("BModule/blockPage", parameters: ["id": 222, "name": "nero"]) { body in
                JCLog("回调参数 == \(String(describing: body))")
            }
        case "路由跳Html":
            URLRouter.default.openRoute("http://www.baidu.com", parameters: [:])
        case "路由重定向":
            let routeMap = ["BModule/blockPage" : "BModule/listPage"]
            URLRouter.default.routeRedirector.updateRedirectRoutes(routeMap)
            URLRouter.default.openRoute("BModule/blockPage", parameters: [:])
        case "路由拦截器":
            URLRouter.default.openRoute("BModule/detailPage", parameters: [:])
//            URLRouter.default.openRoute("BModule/detailPage", parameters: ["token":"123"])
        default:
            break
        }
    }

}
