//
//  JCRouterManager.swift
//  JCBaseService
//
//  Created by 赵凯 on 2024/4/18.
//

import UIKit

public class JCRouterManager: NSObject {

    static public let shared = JCRouterManager()
    
    public var modules: [String] = []
    
    public func registAllModuleRoute() {
        if JCRouterManager.shared.registModuleRoute(moduleName: "AModule.JCAModuleRouter") {
            modules.append("AModule")
        }
        if JCRouterManager.shared.registModuleRoute(moduleName: "BModule.JCBModuleRouter") {
            modules.append("BModule")
        }
        if JCRouterManager.shared.registModuleRoute(moduleName: "CModule.JCCModuleRouter") {
            modules.append("CModule")
        }
    }
    
    /// 注册组件路由
    public func registModuleRoute(moduleName: String, registMethod: String = "regist") -> Bool {
        /// 判断项目中是否有moduleName对应的组件
        if let routerClass = NSClassFromString(moduleName) as? NSObject.Type {
            let object = routerClass.init()
            /// 判断是否有相应的注册方法
            if methodExist(object, registMethod) {
                setupMethod(object, registMethod)
                return true
            }
            return false
        }
        return false
    }
    
    /// 判断实例对象是否有某个指定的方法
    public func methodExist(_ object: NSObject, _ method: String) -> Bool {
        let selector = Selector((method))
        return object.responds(to: selector)
    }
    
    /// 调用实例对象的指定方法
    public func setupMethod(_ object: NSObject, _ method: String) {
        // 获取 myMethod 方法的 IMP（Implementation）
        let methodIMP = class_getMethodImplementation(type(of: object), Selector((method)))
        if methodIMP != nil {
            typealias ObjCFunction = @convention(c) (NSObject, Selector) -> Void
            // 将 IMP 转换为函数指针类型
            let function = unsafeBitCast(methodIMP, to: ObjCFunction.self)
            // 调用函数指针来执行方法
            function(object, Selector((method)))
        }
    }
}
