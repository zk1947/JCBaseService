//
//  JCButton.swift
//  JHProject
//
//  Created by 赵凯 on 2024/1/9.
//

import UIKit

public class JCButton: UIControl {

    public enum ImagePosition {
        case left
        case right
        case top
        case bottom
    }
    
    public var title: String? {
        didSet {
            titleLable.text = title
        }
    }
    
    public var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    public init(title: String, color: UIColor, font: UIFont, image: UIImage, target: AnyObject, action: Selector) {
        super.init(frame: .zero)
        titleLable.text = title
        titleLable.textColor = color
        titleLable.font = font
        imageView.image = image
        self.addTarget(target, action: action, for: .touchUpInside)
    }
    
    public func layoutUI(position: ImagePosition, imageWidth: CGFloat, space: CGFloat = 5.0) {
        self.addSubview(titleLable)
        self.addSubview(imageView)
        switch position {
        case .left:
            imageView.snp.makeConstraints { make in
                make.left.equalToSuperview()
                make.centerY.equalToSuperview()
                make.width.height.equalTo(imageWidth)
            }
            
            titleLable.snp.makeConstraints { make in
                make.left.equalTo(imageView.snp.right).offset(space)
                make.right.centerY.equalToSuperview()
            }
        case .right:
            titleLable.snp.makeConstraints { make in
                make.left.equalToSuperview()
                make.centerY.equalToSuperview()
            }
            
            imageView.snp.makeConstraints { make in
                make.left.equalTo(titleLable.snp.right).offset(space)
                make.right.centerY.equalToSuperview()
                make.width.height.equalTo(imageWidth)
            }
        case .top:
            imageView.snp.makeConstraints { make in
                make.top.centerX.equalToSuperview()
                make.width.height.equalTo(imageWidth)
            }
            
            titleLable.snp.makeConstraints { make in
                make.left.right.bottom.equalToSuperview()
                make.top.equalTo(imageView.snp.bottom).offset(space)
            }
        case .bottom:
            titleLable.snp.makeConstraints { make in
                make.left.right.top.equalToSuperview()
            }
            
            imageView.snp.makeConstraints { make in
                make.top.equalTo(titleLable.snp.bottom).offset(space)
                make.bottom.centerX.equalToSuperview()
                make.width.height.equalTo(imageWidth)
            }
        }
    }
    
    public func layoutUI(position: ImagePosition, imageSize: CGSize, space: CGFloat = 5.0) {
        self.addSubview(titleLable)
        self.addSubview(imageView)
        switch position {
        case .left:
            imageView.snp.makeConstraints { make in
                make.left.equalToSuperview()
                make.centerY.equalToSuperview()
                make.size.equalTo(imageSize)
            }
            
            titleLable.snp.makeConstraints { make in
                make.left.equalTo(imageView.snp.right).offset(space)
                make.right.centerY.equalToSuperview()
            }
        case .right:
            titleLable.snp.makeConstraints { make in
                make.left.equalToSuperview()
                make.centerY.equalToSuperview()
            }
            
            imageView.snp.makeConstraints { make in
                make.left.equalTo(titleLable.snp.right).offset(space)
                make.right.centerY.equalToSuperview()
                make.size.equalTo(imageSize)
            }
        case .top:
            imageView.snp.makeConstraints { make in
                make.top.centerX.equalToSuperview()
                make.size.equalTo(imageSize)
            }
            
            titleLable.snp.makeConstraints { make in
                make.left.right.bottom.equalToSuperview()
                make.top.equalTo(imageView.snp.bottom).offset(space)
            }
        case .bottom:
            titleLable.snp.makeConstraints { make in
                make.left.right.top.equalToSuperview()
            }
            
            imageView.snp.makeConstraints { make in
                make.top.equalTo(titleLable.snp.bottom).offset(space)
                make.bottom.centerX.equalToSuperview()
                make.size.equalTo(imageSize)
            }
        }
    }
    
    public lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    public lazy var titleLable: UILabel = {
        let lable = UILabel()
        return lable
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
