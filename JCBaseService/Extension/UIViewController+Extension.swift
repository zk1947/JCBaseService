//
//  UIViewController+Extension.swift
//  JCBaseService
//
//  Created by 赵凯 on 2024/4/16.
//

import Foundation

public extension UIViewController {
    
    func jc_push(_ viewController: UIViewController?) {
        if viewController != nil {
            if (self.navigationController?.viewControllers.count) ?? 0 > 0 {
                viewController!.hidesBottomBarWhenPushed = true
            }
            self.navigationController?.pushViewController(viewController!, animated: true)
        }
    }
    
    func jc_pop() {
        if navigationController != nil {
            navigationController?.popViewController(animated: true)
        }
    }
    
    func jc_pop(_ completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        CATransaction.commit()
        self.navigationController?.popViewController(animated: true)
    }
    
    func jc_popToVC(_ viewController: UIViewController){
        for vc in (self.navigationController?.viewControllers ?? []) {
            if vc.isKind(of:viewController.classForCoder) {
                self.navigationController?.popToViewController(vc, animated: true)
                return
            }
        }
        self.navigationController?.popToRootViewController(animated: true)
    }
}
