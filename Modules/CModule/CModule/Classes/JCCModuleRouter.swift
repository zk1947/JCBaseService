//
//  JCCModuleRouter.swift
//  CModule
//
//  Created by 赵凯 on 2024/4/24.
//

import UIKit
import JCBaseService

class JCCModuleRouter: NSObject {

    public let router = URLRouter.default
    
    @objc public func regist() {
        router.registerRoute("CModule/homePage") { routeUrl, navigator, completion in
//            JCLog(routeUrl.parameters)
            completion?(JCCModuleHomeController())
            return true
        }
    }
}
