//
//  AModule.swift
//  AModule
//
//  Created by 赵凯 on 2024/4/16.
//

import Foundation
import JCBaseService

func getBundle() -> Bundle {
    if let bundleUrl = Bundle(for: AModule.self).url(forResource: "AModule", withExtension: "bundle") {
        if let bundle = Bundle(url: bundleUrl) {
            return bundle
        }
    }
    return Bundle.main
}

let myBundle = getBundle()

open class AModule: NSObject {
    internal class func image(_ name: String) -> UIImage {
        if let image = UIImage(named: name, in: myBundle, compatibleWith: nil) {
            return image
        }
        return UIImage()
    }
}

extension String {
    /// string localized
    var aLocalized: String {
        return NSLocalizedString(self, bundle: JCLanguageManager.shared.getModuleBundle(moduleBundle: myBundle), comment: "")
    }
}
