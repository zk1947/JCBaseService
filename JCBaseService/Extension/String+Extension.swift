//
//  String+Extension.swift
//  JCBaseService
//
//  Created by 赵凯 on 2024/4/16.
//

import Foundation

extension String {
    public func jc_classFromString() -> AnyClass? {
        guard let bundleName: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String else {
            return nil
        }
        var anyClass: AnyClass? = NSClassFromString(bundleName + "." + self)
        if anyClass == nil {
            anyClass = NSClassFromString(self)
        }
        return anyClass
    }
}
