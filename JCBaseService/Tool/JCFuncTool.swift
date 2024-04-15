//
//  JCFuncTool.swift
//  JCBaseService
//
//  Created by 赵凯 on 2024/4/15.
//

import Foundation

public func JCLog<T>(_ message : T, file : String = #file, funcName : String = #function, lineNum : Int = #line) {
    #if DEBUG
        let fileName = (file as NSString).lastPathComponent
        print("\(Date()): [\(fileName)--\(lineNum)行--]:\(message)")
    #endif
}

public func HexColor(hex: integer_t) -> UIColor {
    return UIColor(red: CGFloat((hex >> 16) & 0xff)/255.0, green: CGFloat((hex >> 8) & 0xff)/255.0, blue: CGFloat(hex & 0xff)/255.0, alpha: 1)
}

public func HexColor(hex: integer_t, alpha: CGFloat) -> UIColor {
    return UIColor(red: CGFloat((hex >> 16) & 0xff)/255.0, green: CGFloat((hex >> 8) & 0xff)/255.0, blue: CGFloat(hex & 0xff)/255.0, alpha: alpha)
}

public func JCFont(_ size: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: size*kScale, weight: .regular)
}

public func JCLightFont(_ size: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: size*kScale, weight: .light)
}

public func JCMediumFont(_ size: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: size*kScale, weight: .medium)
}

public func JCBoldFont(_ size: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: size*kScale, weight: .bold)
}

public func currentViewController() -> UIViewController? {
    var rootViewController: UIViewController?
    if var window = jc_window {
        if window.windowLevel != UIWindow.Level.normal {
            let windows = UIApplication.shared.windows
            for viewWindow in windows {
                if viewWindow.windowLevel == UIWindow.Level.normal {
                    window = viewWindow
                    break
                }
            }
        }
        rootViewController = window.rootViewController
        return getVisibleViewController(from: rootViewController)
    }
    return nil
}
 
public func getVisibleViewController(from vc: UIViewController?) -> UIViewController? {
    if let nc = vc as? UINavigationController {
        return getVisibleViewController(from: nc.visibleViewController)
    } else if let tc = vc as? UITabBarController {
        return getVisibleViewController(from: tc.selectedViewController)
    } else {
        if let pvc = vc?.presentedViewController {
            return getVisibleViewController(from: pvc)
        } else {
            return vc
        }
    }
}
