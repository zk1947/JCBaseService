//
//  UIApplication+Extension.swift
//  JCBaseService
//
//  Created by 赵凯 on 2024/4/28.
//

import Foundation

public extension UIApplication {
    static let runOnce: Void = {
        setUpTableView()
        UIButton.awake()
    }()
    // MARK: 适配TableView
    static func setUpTableView() {
        UITableView.appearance().showsVerticalScrollIndicator = false
        UITableView.appearance().showsHorizontalScrollIndicator = false
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none
        if #available(iOS 11.0, *) {
            UITableView.appearance().contentInsetAdjustmentBehavior = .never
        }
        if #available(iOS 15.0, *) {
            UITableView.appearance().sectionHeaderTopPadding = 0
        }
    }
}
