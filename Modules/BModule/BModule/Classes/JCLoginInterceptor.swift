//
//  JCLoginInterceptor.swift
//  BModule
//
//  Created by 赵凯 on 2024/4/17.
//

import UIKit

class JCLoginInterceptor: NSObject, URLRouteInterceptionAction {
    
    var specifiedRoutes: [JCBaseService.URLRouteName]? { ["Bmodule/detailPage"] }
    
    func interceptRoute(for routeUrl: JCBaseService.RouteURL) -> JCBaseService.URLRouteInterceptionResult {
        if routeUrl.parameters["token"] == nil {            
            JCLog("==== 未登录 ====")
            kPush(viewController: JCBModuleLoginController())
            return .reject
        }
        return .next
    }
    
}
