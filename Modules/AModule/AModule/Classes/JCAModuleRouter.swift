//
//  JCAModuleRouter.swift
//  AModule
//
//  Created by 赵凯 on 2024/4/16.
//

import UIKit
@_exported import JCBaseService
import SafariServices

public class JCAModuleRouter: NSObject {

    static public let shared = JCAModuleRouter()
    
    public let router = URLRouter.default
    
    @objc public func regist() {
        
        // 注册单条路由
        router.registerRoute("AModule/homePage") { routeUrl, navigator, completion in
            completion?(JCAModuleHomeController())
            return true
        }
        
        router.registerRoute("AModule/detailPage") { routeUrl, navigator, completion in
            JCLog(routeUrl.parameters)
            navigator.push(JCAModuleDetailController(), animated: true)
            return true
        }
        
        // h5页面统一路由
        router.registerRoute(URLRouter.webLink) { routeUrl, navigator, completion in
            guard let urlString = routeUrl.parameters["url"] as? String, let url = URL(string: urlString) else {
                return false
            }
            kPush(viewController: SFSafariViewController(url: url))
            return true
        }
        
        // 单独处理某个h5
        router.registerRoute("https://juejin.cn/?sort=three_days_hottest") { url, navigator, completion in
            return true
        }
        
    }
}
