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

        setTitle(title: "A模块")
        
        let button = UIButton.jc_init(image: AModule.image("service"), target: self, action: #selector(buttonAction))
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.left.equalTo(100)
            make.top.equalTo(kStatusAndNavBarHeight)
            make.width.height.equalTo(100)
        }
        
        let lab = UILabel.jc_init(text: "key".aLocalized, textColor: .black, font: JCFont(14))
        lab.frame = CGRect(x: 100, y: 250, width: 300, height: 20)
        view.addSubview(lab)
        
    }
    
    
    @objc func buttonAction() {
        URLRouter.default.openRoute("BModule/listPage", parameters: ["id": 333, "name": "nero"])
    }
    
}
