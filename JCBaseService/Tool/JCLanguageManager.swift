//
//  JCLanguageManager.swift
//  JCBaseService
//
//  Created by 赵凯 on 2024/4/25.
//

import UIKit

public enum Language: String {
    /// 请注意, 这个命名不是随意的, 是根据你本地的语言包,可以show in finder 看到. en.lproj / zh-Hans.lproj
    case Chinese = "zh-Hans"
    case English = "en"
    var code: String {
        return rawValue
    }
}

public class JCLanguageManager: NSObject {
    fileprivate static let kChooseLanguageKey = "ChooseLanguage"
    /// 单例
    static public let shared = JCLanguageManager()

    public var language: Language
    
    private override init() {
        // 第一次初始语言, 获取手机系统语言
        language = Language(rawValue: NSLocale.preferredLanguages.first ?? "zh-Hans") ?? .Chinese
        super.init()
    }

    public func config() {
        // 替换Bundle.main为自定义的JHBundle
        object_setClass(Foundation.Bundle.main, JCBundle.self)
        language = JCLanguageManager.currentLanguage()
    }
    
    /// 保存所选的语言
    static public func saveLanguage(chooseLanguage: Language) {
        UserDefaults.standard.set(chooseLanguage.rawValue, forKey: kChooseLanguageKey)
    }

    /// 获取当前保存的语言,如果从未保存过获取手机系统语言,如果应用支持的语言不包含系统语言默认显示中文
    static public func currentLanguage() -> Language {
       let langString = UserDefaults.standard.string(forKey: kChooseLanguageKey)
        guard let desLangString = langString else {
            var source = NSLocale.preferredLanguages.first
            if source == "zh-Hans-CN" {
                source = Language.Chinese.rawValue
            }
            return Language(rawValue: source ?? "zh-Hans") ?? .Chinese
        }
        return Language(rawValue: desLangString) ?? .Chinese
    }

    private var bundleByLanguageCode: [String: Foundation.Bundle] = [:]
    var bundle: Foundation.Bundle? {
        /// 存起来, 避免一直创建
        if let bundle = bundleByLanguageCode[language.rawValue] {
            return bundle
        } else {
            let mainBundle = Foundation.Bundle.main
            if let path = mainBundle.path(forResource: language.rawValue, ofType: "lproj"),
                let bundle = Foundation.Bundle(path: path) {
                bundleByLanguageCode[language.rawValue] = bundle
                return bundle
            } else {
                return nil
            }
        }
    }
    
    public func getModuleBundle(moduleBundle: Bundle) -> Bundle {
        let key = moduleBundle.bundlePath+"/"+language.rawValue+".lproj"
        if let bundle = bundleByLanguageCode[key] {
            return bundle
        } else {
            if let path = moduleBundle.path(forResource: language.rawValue, ofType: "lproj"),
               let bundle = Foundation.Bundle(path: path) {
                bundleByLanguageCode[bundle.bundlePath] = bundle
                return bundle
            }
        }
        return moduleBundle
    }
}

/// 首先, 我们会在启动时设置成我们自己的Bundle,这样就可以做到,当使用时会调用这个方法.
public class JCBundle: Foundation.Bundle {
    public override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        if let bundle = JCLanguageManager.shared.bundle {
            return bundle.localizedString(forKey: key, value: value, table: tableName)
        } else {
            return super.localizedString(forKey: key, value: value, table: tableName)
        }
    }
}
