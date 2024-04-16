//
//  UILable+Extension.swift
//  JCBaseService
//
//  Created by 赵凯 on 2024/4/16.
//

import Foundation

public extension UILabel {

    class func jc_init(text: String, textColor: UIColor, font: UIFont) -> Self {
        let lab = self.init()
        lab.text = text
        lab.textColor = textColor
        lab.font = font
        return lab
    }

    class func jc_init(text: String, textColor: UIColor, font: UIFont, textAlignment: NSTextAlignment) -> Self {
        let lab = self.init()
        lab.text = text
        lab.textColor = textColor
        lab.font = font
        lab.textAlignment = textAlignment
        return lab
    }

    func jc_setAttributedText(wholeStr: String, modifyStr: String, attributes: [NSAttributedString.Key: Any]) {
        let attributedStr = NSMutableAttributedString(string: wholeStr)
        if wholeStr.contains(modifyStr) {
            let range: Range = wholeStr.range(of: modifyStr)!
            let location = wholeStr.distance(from: wholeStr.startIndex, to: range.lowerBound)
            attributedStr.addAttributes(attributes, range: NSRange(location: location, length: modifyStr.count ))
            self.attributedText = attributedStr
        }
    }
    
    func jc_setAttributedTexts(wholeStr: String, modifyStrs: [String], attributess: [[NSAttributedString.Key: Any]]) {
        let attributedStr = NSMutableAttributedString(string: wholeStr)
        for index in modifyStrs.indices {
            let keyString = modifyStrs[index]
            let param = attributess[index]
            if wholeStr.contains(keyString) {
                let range: Range = wholeStr.range(of: keyString)!
                let location = wholeStr.distance(from: wholeStr.startIndex, to: range.lowerBound)
                attributedStr.addAttributes(param, range: NSRange(location: location, length: keyString.count ))
                self.attributedText = attributedStr
            }
        }
    }
    
    func jc_setAllAttributed(wholeStr: String, modifyStr: String, attributes: [NSAttributedString.Key: Any]) {
        let attributedString = NSMutableAttributedString(string: wholeStr)
        // 查询指定字符串在文本中的所有位置
        var range = wholeStr.range(of: modifyStr)
        var positions: [Int] = []
        while range != nil {
            // 获取找到的位置并添加到数组中
            if let r = range {
                let position = wholeStr.distance(from: wholeStr.startIndex, to: r.lowerBound)
                positions.append(position)
                // 继续查询下一个位置
                range = wholeStr.range(of: modifyStr, options: [], range: r.upperBound..<wholeStr.endIndex)
            } else {
                break
            }
        }
        for index in positions {
            attributedString.addAttributes(attributes, range: NSRange(location: index, length: modifyStr.count ))
        }
        self.attributedText = attributedString
    }
}
