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
        
        tableView.snp.makeConstraints { (maker) in
            maker.edges.equalTo(self.view).inset(UIEdgeInsets.zero)
        }
    }

    func loadData() {
        dataList.removeAll()
        
        let situations = ["高度固定弹窗,viewController不全屏", "高度固定弹窗,viewController全屏", "高度自适应弹窗,viewController全屏", "present 带 navigation的弹窗", "在弹窗上present vc", "高度自适应弹窗,viewController全屏,在弹窗上present vc", "系统", "继承baseAlert", "下上"]
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            self.handleClickCell(at: indexPath)
        }
    }
    
    func handleClickCell(at indexPath: IndexPath) {
        print("点击 cell")
        if indexPath.row == 0 {
            let root: UIViewController? = UIApplication.shared.delegate?.window??.rootViewController
            print(root!)
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
        } else if indexPath.row == 4 {
            let alert = JKPushAlertViewController.init()
            alert.jk_show(withViewController: self, animated: true) {
                
            }
            alert.confirmBtnDidClickedBlk = { [weak alert, weak self] in
                let detail = FDEDetailViewController.init()
//                detail.modalPresentationStyle = .overFullScreen //不能是fullScreen否则alert会变大
                detail.modalPresentationStyle = .fullScreen
                alert?.present(detail, animated: true) {
                    print(detail.presentingViewController)
                }
            }
        } else if indexPath.row == 5 {
            let alert = JKBroadcastBeginAlertViewController.init()
            alert.jk_show(withViewController: self, animated: true) {

            }
            alert.sureBtnDidClickedBlk = {[weak alert, weak self] in
                let detail = FDEDetailViewController.init()
                detail.modalPresentationStyle = .fullScreen
                alert?.present(detail, animated: true) {
                    print(detail.presentingViewController)
                }
            }
        } else if indexPath.row == 6 {
//            let root: UIViewController? = UIApplication.shared.delegate?.window??.rootViewController
//            let detail = FDEDetailViewController.init()
//            detail.modalPresentationStyle = .fullScreen
//            self.present(detail, animated: true) { [weak detail, weak self] in
//                print(root?.presentingViewController) //nil
//                print(root?.presentedViewController)    //FDEDetailViewController: 0x159e331e0
//                print(self?.presentingViewController) //nil
//                print(self?.presentedViewController)    //FDEDetailViewController: 0x159e331e0
//                print(detail?.presentingViewController) //FDETabBarController: 0x159d05c80
//                print(detail?.presentedViewController) //nil
//            }
            
//            let root: UIViewController? = UIApplication.shared.delegate?.window??.rootViewController
//            let detail = FDEDetailViewController.init()
//            detail.modalPresentationStyle = .currentContext
//            self.present(detail, animated: true) { [weak detail, weak self] in
//                print(root?.presentingViewController) //nil
//                print(root?.presentedViewController)    //nil
//                print(self?.presentingViewController) //nil
//                print(self?.presentedViewController)    //FDEDetailViewController: 0x159e331e0
//                print(detail?.presentingViewController) //FDENavigationController: 0x101026a00
//                print(detail?.presentedViewController) //nil
//            }
            
            let root: UIViewController? = UIApplication.shared.delegate?.window??.rootViewController
            let detail = FDEDetailViewController.init()
            detail.modalPresentationStyle = .overCurrentContext
            self.definesPresentationContext = true //默认是false，但在一些系统容器vc中默认是true
            self.present(detail, animated: true) { [weak detail, weak self] in
                print(root?.presentingViewController) //nil
                print(root?.presentedViewController)    //nil
                print(self?.presentingViewController) //nil
                print(self?.presentedViewController)    //FDEDetailViewController: 0x159e331e0
                print(detail?.presentingViewController) //FDEHomeViewController: 0x100e08890
                print(detail?.presentedViewController) //nil
            }
            
//            let root: UIViewController? = UIApplication.shared.delegate?.window??.rootViewController
//            let detail = FDEDetailViewController.init()
//            detail.modalPresentationStyle = .fullScreen
//            root?.present(detail, animated: true) { [weak detail, weak self] in
//                print(root?.presentingViewController)  //nil
//                print(root?.presentedViewController)    //FDEDetailViewController: 0x100f48f80
//                print(self?.presentingViewController)  //nil
//                print(self?.presentedViewController)    //FDEDetailViewController: 0x100f48f80
//                print(detail?.presentingViewController) //FDETabBarController: 0x1018084a0
//                print(detail?.presentedViewController) //nil
//            }
            
//            let root: UIViewController? = UIApplication.shared.delegate?.window??.rootViewController
//            let detail = FDEDetailViewController.init()
//            detail.modalPresentationStyle = .currentContext
//            root?.present(detail, animated: true) { [weak detail, weak self] in
//                print(root?.presentingViewController)  //nil
//                print(root?.presentedViewController)    //FDEDetailViewController: 0x100f48f80
//                print(self?.presentingViewController)  //nil
//                print(self?.presentedViewController)    //FDEDetailViewController: 0x100f48f80
//                print(detail?.presentingViewController) //FDETabBarController: 0x1018084a0
//                print(detail?.presentedViewController) //nil
//            }
        } else if indexPath.row == 7 {
            let alert = ZAEAuditionEndBuyAlertViewController.init()
            alert.jk_show(withViewController: self, animated: true) {

            }
            alert.buyBtnDidClickedBlk = {[weak alert, weak self] in
                let detail = FDEDetailViewController.init()
                detail.modalPresentationStyle = .fullScreen
                alert?.present(detail, animated: true) { [weak detail] in
                    print(detail?.presentingViewController ?? "")
                }
            }
        } else if indexPath.row == 8 {
            let alert = ZAESupportGroupVoteAlertViewController.init()
            alert.jk_show(withViewController: self, animated: true) {

            }
            alert.confirmBtnDidClickedBlk = {[weak alert, weak self] selectedItem  in
                let detail = FDEDetailViewController.init()
                detail.modalPresentationStyle = .fullScreen
                alert?.present(detail, animated: true) { [weak detail] in
                    print(detail?.presentingViewController ?? "")
                }
            }
        }
    }
}


