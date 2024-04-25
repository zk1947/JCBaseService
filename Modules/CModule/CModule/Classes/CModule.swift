//
//  File.swift
//  CModule
//
//  Created by 赵凯 on 2024/4/24.
//

import Foundation

open class CModule: NSObject {
    internal class func image(_ name: String) -> UIImage {
        let primaryBundle = Bundle(for: CModule.self)
        if let image = UIImage(named: name, in: primaryBundle, compatibleWith: nil) {
            return image
        } else if
            let subBundleUrl = primaryBundle.url(forResource: "CModule", withExtension: "bundle"),
            let subBundle = Bundle(url: subBundleUrl),
            let image = UIImage(named: name, in: subBundle, compatibleWith: nil){
            return image
        }
        return UIImage()
    }
}

extension String {
    
    /// string localized
    var cLocalized: String {
        return NSLocalizedString(self, tableName: "CModule", bundle: Bundle(for: CModule.self), comment: "")
    }
    
}
