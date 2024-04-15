//
//  JCBaseViewController.swift
//  JCBaseService
//
//  Created by 赵凯 on 2024/4/15.
//

import UIKit
import SnapKit

public class JCBaseViewController: UIViewController, UIGestureRecognizerDelegate {

    deinit {
        #if DEBUG
        print("🔥deinit:－－－－ \(NSStringFromClass(type(of: self)).components(separatedBy: ".").last!)－－－－:deinit🔥")
        #endif
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.edgesForExtendedLayout = UIRectEdge.all
        self.view.backgroundColor = .white
        showNavView()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 隐藏系统导航栏
        self.navigationController?.isNavigationBarHidden = true
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 开启侧滑返回手势
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }

    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // 视图消失回收键盘
        self.view.endEditing(true)
    }

    public func showNavView() {
        // 整个navView
        self.view.addSubview(self.jhNavView)
        self.jhNavView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(kStatusAndNavBarHeight)
        }
        self.jhNavView.isUserInteractionEnabled = true
        // title
        self.jhNavView.addSubview(self.jhTitleLabel)
        self.jhTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(kNavBarHeight)
            make.width.lessThanOrEqualTo(kScreenWidth-150)
        }
        // leftButton
//        if (UIViewController.current().navigationController?.viewControllers.count) ?? 0 > 1 {
//            initLeftButtonWithImage(image: Asset.Common.backImg.image, action: #selector(backAction))
//        }
    }

    public func removeNavView() {
        self.jhNavView.removeFromSuperview()
    }

    public func setTitle(title: String) {
        self.jhTitleLabel.text = title
    }
    
    public lazy var jhNavView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.white
        return view
    }()

    public lazy var jhTitleLabel: UILabel = {
        let lab = UILabel()
        lab.textColor = UIColor.black
        lab.font = JCMediumFont(17)
        lab.textAlignment = NSTextAlignment.center
        lab.adjustsFontSizeToFitWidth = true
        return lab
    }()

    public lazy var jhLeftButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.adjustsImageWhenHighlighted = false
        btn.setTitleColor(UIColor.black, for: .normal)
        return btn
    }()

    public lazy var jhRightButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.adjustsImageWhenHighlighted = false
        return btn
    }()
    
    func initLeftButtonWithImage(image: UIImage, action: Selector) {
        self.jhLeftButton.removeFromSuperview()
        self.jhLeftButton.setImage(image, for: .normal)
        self.jhLeftButton.addTarget(self, action: action, for: .touchUpInside)
        self.jhNavView.addSubview(self.jhLeftButton)
        self.jhLeftButton.snp.makeConstraints { make in
            make.left.equalTo(5)
            make.bottom.equalToSuperview()
            make.size.equalTo(CGSize(width: 44, height: 44))
        }
    }

    func initRightButtonWithTitle(title: String, action: Selector) {
        self.jhRightButton.removeFromSuperview()
        self.jhRightButton.setTitle(title, for: .normal)
        self.jhRightButton.setTitleColor(UIColor.black, for: .normal)
        self.jhRightButton.titleLabel?.font = JCFont(14)
        self.jhRightButton.addTarget(self, action: action, for: .touchUpInside)
        self.jhNavView.addSubview(self.jhRightButton)
        self.jhRightButton.snp.makeConstraints { make in
            make.right.equalTo(-12)
            make.bottom.equalToSuperview()
            make.height.equalTo(kNavBarHeight)
            make.width.lessThanOrEqualTo(kScreenWidth/2)
        }
    }

    func initRightButtonWithImage(image: UIImage, action: Selector) {
        self.jhRightButton.removeFromSuperview()
        self.jhRightButton.setImage(image, for: .normal)
        self.jhRightButton.addTarget(self, action: action, for: .touchUpInside)
        self.jhNavView.addSubview(self.jhRightButton)
        self.jhRightButton.snp.makeConstraints { make in
            make.right.equalTo(-12)
            make.bottom.equalToSuperview()
            make.size.equalTo(CGSize(width: kNavBarHeight, height: kNavBarHeight))
        }
    }
    
    @objc func backAction() {
        
    }
}
