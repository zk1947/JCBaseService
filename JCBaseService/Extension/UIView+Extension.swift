//
//  UIView+Extension.swift
//  JCBaseService
//
//  Created by 赵凯 on 2024/4/16.
//

import Foundation

public extension UIView {
    
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: newValue, height: self.frame.size.height)
        }
    }
    
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.size.width, height: newValue)
        }
    }
    
    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame = CGRect(x: newValue, y: self.frame.origin.y, width: self.frame.size.width, height: self.frame.size.height)
        }
    }
    
    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame = CGRect(x: self.frame.origin.x, y: newValue, width: self.frame.size.width, height: self.frame.size.height)
        }
    }
    
    var centerX: CGFloat {
        get {
            return self.center.x
        }
        set {
            self.center = CGPoint(x: newValue, y: self.center.y)
        }
    }
    
    var centerY: CGFloat {
        get {
            return self.center.y
        }
        set {
            self.center = CGPoint(x: self.center.x, y: newValue)
        }
    }
    
    var top: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame = CGRect(x: self.frame.origin.x, y: newValue, width: self.frame.size.width, height: self.frame.size.height)
        }
    }
    
    var bottom: CGFloat {
        get {
            return frame.origin.y + frame.size.height
        }
        set {
            self.frame = CGRect(x: self.frame.origin.x, y: newValue - self.frame.size.height, width: self.frame.size.width, height: self.frame.size.height)
        }
    }
    
    var left: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame = CGRect(x: newValue, y: self.frame.origin.y, width: self.frame.size.width, height: self.frame.size.height)
        }
    }
    
    var right: CGFloat {
        get {
            return self.frame.origin.x + self.frame.size.width
        }
        set {
            self.frame = CGRect(x: newValue - self.frame.size.width, y: self.frame.origin.y, width: self.frame.size.width, height: self.frame.size.height)
        }
    }
    
    var size: CGSize {
        get {
            return frame.size
        }
        set {
            self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: newValue.width, height: newValue.height)
        }
    }
    
    func jc_cornerRadius(radius: CGFloat) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius  = radius
    }

    func jc_setPartCornerRadius(radius: CGFloat, rectCorner: UIRectCorner) {
        self.superview?.layoutIfNeeded()
        let maskPath = UIBezierPath.init(roundedRect: self.bounds, byRoundingCorners: rectCorner, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer.init()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
    
    func jc_radiusAndBorder(radius: CGFloat, borderColor: UIColor, borderWidth: CGFloat = 1) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius  = radius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
    }
}
