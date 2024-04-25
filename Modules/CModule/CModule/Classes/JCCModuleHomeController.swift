//
//  JCCModuleHomeController.swift
//  BModule
//
//  Created by 赵凯 on 2024/4/24.
//

import UIKit
import JCBaseService

class JCCModuleHomeController: JCBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setTitle(title: "C模块")
        
        
        let lab = UILabel.jc_init(text: "key".cLocalized, textColor: .black, font: JCFont(14))
        lab.frame = CGRect(x: 100, y: 250, width: 300, height: 20)
        view.addSubview(lab)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


