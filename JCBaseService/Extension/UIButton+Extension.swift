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

extension UIButton: JCReplaceMethod {
    private static var img_size: Void?
    
    public var jc_imgSize: CGFloat {
        get {
            (objc_getAssociatedObject(self, &Self.img_size) as? CGFloat) ?? 0.0
        }
        set {
            objc_setAssociatedObject(self, &Self.img_size, newValue, .OBJC_ASSOCIATION_COPY)
        }
    }
    
    static func awake() {
        UIButton.takeOnceTime
    }

    private static let takeOnceTime: Void = {
        let originalSelector = #selector(layoutSubviews)
        let swizzledSelector = #selector(jc_layoutSubviews)
        swizzlingForClass(UIButton.self, originalSelector: originalSelector, swizzledSelector: swizzledSelector)
    }()

    @objc public func jc_layoutSubviews() {
        jc_layoutSubviews()
        if self.jc_imgSize > 0 {
            self.imageView?.frame = CGRect(x: (self.width-self.jc_imgSize)/2, y: (self.height-self.jc_imgSize)/2, width: self.jc_imgSize, height: self.jc_imgSize)
        }
    }
}
