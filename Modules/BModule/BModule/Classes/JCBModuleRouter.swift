//
//  JCBModuleRouter.swift
//  AModule
//
//  Created by 赵凯 on 2024/4/16.
//

import UIKit
import JCBaseService

public class JCBModuleRouter: NSObject {

    static public let shared = JCBModuleRouter()
    
    public let router = URLRouter.default
    
    public func regist() {
        // 注册聚合路由
        router.registerRoute("Bmodule") { routeUrl, navigator, completion in
            JCLog(routeUrl.parameters)
            switch routeUrl.path {
            case "/homePage":
                navigator.push(JCBModuleHomeController(), animated: true)
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2, execute: {
                  completion?("666")
                })
                return true
            case "/listPage":
                navigator.push(JCBModuleListController(), animated: true)
                return true
            case "/detailPage":
                navigator.push(JCBModuleDetailController(), animated: true)
                return true
            default:
                return false
            }
        }
        
        // 添加默认拦截Action
//        let action = URLRouteInterceptor.Action(specifiedRoutes: ["Bmodule/homePage"]) {routeUrl in
//            // 定义拦截规则
//            JCLog("000")
//            return .reject
//        }
//        router.routeInterceptor.append(action)
        
        // 添加自定义拦截器
        router.routeInterceptor.append(JCLoginInterceptor())
    }
}


