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
        
        self.resourceArr = ["路由跳转","路由带回调","路由跳Html","路由重定向", "拦截器，未登录拦截跳登陆", "拦截器，已登录不拦截"]
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
            URLRouter.default.openRoute("AModule/detailPage", parameters: ["id": 111, "name": "nero"])
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
        case "拦截器，未登录拦截跳登陆":
            URLRouter.default.openRoute("BModule/detailPage", parameters: [:])
        case "拦截器，已登录不拦截":
            URLRouter.default.openRoute("BModule/detailPage", parameters: ["token":"123"])
        default:
            break
        }
    }

}
