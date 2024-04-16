//
//  JCConstant.swift
//  JCBaseService
//
//  Created by 赵凯 on 2024/4/15.
//

import UIKit

public let jc_window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first

public let jc_currentVC = currentViewController()

public let kScreenWidth = UIScreen.main.bounds.width

public let kScreenHeight = UIScreen.main.bounds.height

public let kStatusBarHeight = jc_window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0

public let kNavBarHeight = UINavigationController.init().navigationBar.frame.height

public let kTabBarHeight = UITabBarController.init().tabBar.frame.height

public let kBottomSafeAreaHeight = jc_window?.safeAreaInsets.bottom ?? 0

public let kStatusAndNavBarHeight = kStatusBarHeight + kNavBarHeight

public let kTabBarAndBottomSafeHeight = kTabBarHeight + kBottomSafeAreaHeight

public let kScale = kScreenWidth / CGFloat(375)
