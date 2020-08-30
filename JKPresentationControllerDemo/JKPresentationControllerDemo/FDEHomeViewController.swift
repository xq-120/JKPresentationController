//
//  ViewController.swift
//  DemonSwift
//
//  Created by jekyttt on 2020/1/30.
//  Copyright © 2020 jekyttt. All rights reserved.
//

import UIKit
import JKPresentationController
import FDFullscreenPopGesture

class FDEHomeViewController: FDEBaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: .plain)
        tableView.tableFooterView = UIView.init()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    var dataList: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubview()
        loadData()
    }
    
    func setupSubview() {
        self.navigationItem.title = "首页"
        
        view.addSubview(tableView)
        tableView.frame = view.frame
    }

    func loadData() {
        dataList.removeAll()
        
        let situations = ["高度固定弹窗,viewController不全屏", "高度固定弹窗,viewController全屏", "高度自适应弹窗,viewController全屏", "present 带 navigation的弹窗"]
        dataList.append(contentsOf: situations)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let title = dataList[indexPath.row]
        cell.textLabel?.text = title
        cell.selectionStyle = .none
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        if indexPath.row == 0 {
            let base: UIViewController? = UIApplication.shared.delegate?.window??.rootViewController
            print(base!)
            let top = UIViewController.topViewController()
            print(top!)
            let alert = JKPushAlertViewController.init()
            alert.jk_show(withViewController: self, animated: true) {
                
            }
        } else if indexPath.row == 1 {
            let alert = JKPublishCommentAlertViewController.init()
            alert.jk_show(withViewController: self, animated: true) {
                
            }
        } else if indexPath.row == 2 {
            let alert = JKBroadcastBeginAlertViewController.init()
            alert.jk_show(withViewController: self, animated: true) {

            }
            alert.sureBtnDidClickedBlk = { [unowned self] in
                let detail = FDEDetailViewController.init()
                detail.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(detail, animated: true)
            }
        } else if indexPath.row == 3 {
            let alert = JKBroadcastBeginAlertViewController.init()
            alert.fd_prefersNavigationBarHidden = true
            alert.sureBtnDidClickedBlk = { [unowned alert] in
                let detail = FDEDetailViewController.init()
                detail.hidesBottomBarWhenPushed = true
                alert.navigationController?.pushViewController(detail, animated: true)
            }
            let nav = UINavigationController.init(rootViewController: alert)
            nav.jk_presentAnimation = JKFadeInPresentAnimation.init()
            nav.jk_dismissAnimation = JKFadeOutDismissAnimation.init()
            nav.jk_show(withViewController: self, animated: true) {
                
            }
        }
    }
}


