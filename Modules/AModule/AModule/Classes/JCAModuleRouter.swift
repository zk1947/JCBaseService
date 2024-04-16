//
//  JCAModuleRouter.swift
//  AModule
//
//  Created by 赵凯 on 2024/4/16.
//

import UIKit
import JCBaseService

public class JCAModuleRouter: NSObject {

    static public let shared = JCAModuleRouter()
    
    public let router = URLRouter.default
    
    public func regist() {
        // 注册单条路由
        router.registerRoute("AModule/homePage") { routeUrl, navigator, completion in
            JCLog(routeUrl.parameters)
            navigator.push(JCAModuleHomeController(), animated: true)
            return true
        }
    }
}
