//
//  ViewController.swift
//  JCBaseService
//
//  Created by zk1947@163.com on 04/15/2024.
//  Copyright (c) 2024 zk1947@163.com. All rights reserved.
//

import UIKit
import JCBaseService
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = .white
        
        let vc = currentViewController()
        JCLog("vc == \(String(describing: vc.self))")
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = JCBaseViewController()
        jc_push(vc)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

