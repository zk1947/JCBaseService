//
//  ViewController.swift
//  JCProject
//
//  Created by 赵凯 on 2024/4/23.
//

import UIKit
import JCBaseService

class ViewController: JCBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setTitle(title: "mainModule".localized)
        view.backgroundColor = .white
        
        initRightButtonWithTitle(title: "切换语言", action: #selector(buttonAction))
    }

    @objc func buttonAction() {
        let alertController = UIAlertController(title: nil, message: nil,
                                                preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let deleteAction = UIAlertAction(title: "中文", style: .default, handler: {_ in
            JCLanguageManager.shared.changeLanguage(language: .Chinese)
            jc_window?.rootViewController = JCMainTabBarController()
        })
        let archiveAction = UIAlertAction(title: "英文", style: .default, handler: {_ in
            JCLanguageManager.shared.changeLanguage(language: .English)
            jc_window?.rootViewController = JCMainTabBarController()
        })
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        alertController.addAction(archiveAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

