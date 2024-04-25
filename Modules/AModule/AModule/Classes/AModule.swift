//
//  AModule.swift
//  AModule
//
//  Created by 赵凯 on 2024/4/16.
//

import Foundation
import JCBaseService

open class AModule: NSObject {
    internal class func image(_ name: String) -> UIImage {
        let primaryBundle = Bundle(for: AModule.self)
        if let image = UIImage(named: name, in: primaryBundle, compatibleWith: nil) {
            return image
        } else if
            let subBundleUrl = primaryBundle.url(forResource: "AModule", withExtension: "bundle"),
            let subBundle = Bundle(url: subBundleUrl),
            let image = UIImage(named: name, in: subBundle, compatibleWith: nil){
            return image
        }
        return UIImage()
    }
    
}

extension String {
    /// string localized
    var aLocalized: String {
        return NSLocalizedString(self, bundle: JCLanguageManager.shared.getModuleBundle(moduleBundle: Bundle(for: AModule.self)), comment: "")
    }
}
