//
//  JCMainTabBarController.swift
//  JCProject
//
//  Created by 赵凯 on 2024/4/23.
//

import UIKit
import ESTabBarController_swift
import JCBaseService

class JCMainTabBarController: ESTabBarController {

    var vcs: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for moduleName in JCRouterManager.shared.modules {
            self.addTabBarItem(tabName: moduleName)
        }
        
        let vc = ViewController()
        let nav = UINavigationController(rootViewController: vc)
        vc.tabBarItem = ESTabBarItem.init(self.creatTabbarItem(), title: "D", image: UIImage(named: "home_nomal"), selectedImage: UIImage(named: "home_select"), tag: self.viewControllers?.count ?? 0)
        self.vcs.append(nav)
        
        self.viewControllers = vcs
        // 设置tabBar样式
        self.tabBar.backgroundColor = UIColor.white
        self.tabBar.shadowImage = nil
        self.tabBar.layer.shadowColor = UIColor.black.cgColor
        self.tabBar.layer.shadowRadius = 10.0
        self.tabBar.layer.shadowOpacity = 0.1
        self.tabBar.layer.shadowOffset = CGSize(width: 0, height: -1)
    }
    
    func addTabBarItem(tabName: String) {
        _ = URLRouter.default.openRoute(tabName+"/getPage", parameters: [:]) { viewController in
            let vc = viewController as! UIViewController
            let nav = UINavigationController(rootViewController: vc)
            vc.tabBarItem = ESTabBarItem.init(self.creatTabbarItem(), title: tabName, image: UIImage(named: "home_nomal"), selectedImage: UIImage(named: "home_select"), tag: self.viewControllers?.count ?? 0)
            self.vcs.append(nav)
        }
    }
    
    func creatTabbarItem() -> ESTabBarItemContentView {
        let tabBarItemContentView = ESTabBarItemContentView()
        tabBarItemContentView.textColor = UIColor.darkGray
        tabBarItemContentView.highlightTextColor = UIColor.red
        tabBarItemContentView.renderingMode = .alwaysOriginal
        return tabBarItemContentView
    }

}
