//
//  JCBaseTableViewController.swift
//  JCBaseService
//
//  Created by 赵凯 on 2024/4/16.
//

import UIKit

open class JCBaseTableViewController: JCBaseViewController , UITableViewDelegate, UITableViewDataSource {
    
    public var cellModelBlock: (_ cell: UITableViewCell, _ model: Any) -> Void = {_, _ in}

    public var resourceArr: [Any] = [Any]()

    var _cellIdentifier: String?
    public var cellIdentifier: String {
        get {
            return _cellIdentifier!
        }
        set {
            _cellIdentifier = newValue
            tableView.register(_cellIdentifier?.jc_classFromString(), forCellReuseIdentifier: _cellIdentifier!)
        }
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(kStatusAndNavBarHeight)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    public lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .clear
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.resourceArr.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier) ?? UITableViewCell()
        cell.selectionStyle = .none
        let model = self.resourceArr[indexPath.row]
        cellModelBlock(cell, model)
        return cell
    }

}

