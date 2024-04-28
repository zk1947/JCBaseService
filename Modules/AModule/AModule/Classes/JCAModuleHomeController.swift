//
//  JCAModuleHomeController.swift
//  AModule
//
//  Created by 赵凯 on 2024/4/16.
//

import UIKit
import JCBaseService

open class JCAModuleHomeController: JCBaseViewController {

    open override func viewDidLoad() {
        super.viewDidLoad()

        setTitle(title: "AModule".aLocalized)
        
        let button = UIButton.jc_init(image: AModule.image("service"), target: self, action: #selector(buttonAction))
        button.jc_imgSize = 20
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.left.equalTo(100)
            make.top.equalTo(kStatusAndNavBarHeight)
            make.width.height.equalTo(50)
        }

    }
    
    @objc func buttonAction() {
//        URLRouter.default.openRoute("BModule/listPage", parameters: ["id": 333, "name": "nero"])
    }
    
}
