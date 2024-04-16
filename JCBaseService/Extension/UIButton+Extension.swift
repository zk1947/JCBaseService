//
//  UIButton+Extension.swift
//  JCBaseService
//
//  Created by 赵凯 on 2024/4/16.
//

import Foundation

public extension UIButton {
    class func jc_init(title: String, textColor: UIColor, font: UIFont, target: AnyObject, action: Selector) -> UIButton {
        let btn = UIButton(type: .custom)
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(textColor, for: .normal)
        btn.titleLabel?.font = font
        btn.addTarget(target, action: action, for: .touchUpInside)
        return btn
    }
    
    class func jc_init(image: UIImage, target: AnyObject, action: Selector) -> UIButton {
        let btn = UIButton(type: .custom)
        btn.setImage(image, for: .normal)
        btn.addTarget(target, action: action, for: .touchUpInside)
        return btn
    }
    
    class func jc_init(title: String, image: UIImage, textColor: UIColor, font: UIFont, target: AnyObject, action: Selector) -> UIButton {
        let btn = UIButton(type: .custom)
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(textColor, for: .normal)
        btn.titleLabel?.font = font
        btn.setImage(image, for: .normal)
        btn.addTarget(target, action: action, for: .touchUpInside)
        return btn
    }
    
    class func jc_init(title: String, textColor: UIColor, font: UIFont, cornerRadius: CGFloat , backColor: UIColor, target: AnyObject, action: Selector) -> UIButton {
        let btn = UIButton(type: .custom)
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(textColor, for: .normal)
        btn.titleLabel?.font = font
        btn.backgroundColor = backColor
        btn.layer.cornerRadius = cornerRadius
        btn.layer.masksToBounds = true
        btn.addTarget(target, action: action, for: .touchUpInside)
        return btn
    }
    
}
