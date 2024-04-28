//
//  UITextView+Extension.swift
//  JCBaseService
//
//  Created by 赵凯 on 2024/4/28.
//

import Foundation

extension UITextView {
    
    private static let kPlaceholderTag = 2024
    
    public var jc_placeholder: String {
        set {
            if let lb = viewWithTag(UITextView.kPlaceholderTag) as? UILabel {
                lb.text = newValue
            } else {
                let lb = UILabel()
                lb.tag = UITextView.kPlaceholderTag
                lb.font = font
                lb.numberOfLines = 0
                lb.textColor = .lightGray
                lb.text = newValue
                addSubview(lb)
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.1, execute: {
                    lb.snp.makeConstraints { make in
                        make.left.equalTo(3)
                        make.width.equalTo(self.width-3)
                        make.top.equalTo(6)
                    }
                })
                setValue(lb, forKey: "_placeholderLabel")
            }
        }
        get {
            let lb = value(forKey: "_placeholderLabel") as? UILabel
            return lb?.text ?? ""
        }
    }
}
