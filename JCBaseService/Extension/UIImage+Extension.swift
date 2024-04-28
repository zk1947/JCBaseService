//
//  UIImage+Extension.swift
//  JCBaseService
//
//  Created by 赵凯 on 2024/4/16.
//

import Foundation
import Kingfisher

public extension UIImage {
    /// 根据颜色生成图片
    class func jc_imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        color.set()
        UIRectFill(CGRect(x: 0.0, y: 0.0, width: rect.width, height: rect.height))
        let image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        UIGraphicsEndImageContext()
        return image
    }
}

public extension UIImageView {
    class func jc_init(image: UIImage) -> UIImageView {
        let imgv = UIImageView()
        imgv.image = image
        return imgv
    }

    func jc_setImageWithUrl(urlStr: String) {
        let url = URL(string: urlStr)
        let placeholderImg =  UIImage.init(named: "placeholderImg")
        self.kf.setImage(with: url, placeholder: placeholderImg, options: nil, completionHandler: nil)
    }

    func jc_setImageWithUrl(urlStr: String, placeHolder: String) {
        let url = URL(string: urlStr)
        let placeholderImg =  UIImage.init(named: placeHolder)
        self.kf.setImage(with: url, placeholder: placeholderImg, options: nil, completionHandler: nil)
    }
        
    /// 设定图标颜色
    func jc_setImageWithColor(image: UIImage, color: UIColor) {
        self.image = image.withRenderingMode(.alwaysTemplate)
        self.tintColor = color
    }
}
