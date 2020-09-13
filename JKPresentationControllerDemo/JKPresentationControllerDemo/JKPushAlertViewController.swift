//
//  JKPushAlertViewController.swift
//  UIPresentationController_demo
//
//  Created by jekyttt on 2019/3/25.
//  Copyright © 2019 jekyttt. All rights reserved.
//

import UIKit
import UserNotifications
import JKPresentationController

private let kPushAlertViewWidth: CGFloat = 234.0
private let kPushAlertViewHeight: CGFloat = 264.0

class JKPushAlertViewController: FDEBaseViewController {

    override var jk_presentedViewFrame: CGRect {
        return CGRect.init(x: 40, y: (UIScreen.main.bounds.size.height - kPushAlertViewHeight) / 2.0, width: UIScreen.main.bounds.size.width - 2 * 40, height: kPushAlertViewHeight)
    }
    
    lazy var lightRedBgView: UIView = {
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        view.alpha = 0.35
        return view
    }()
    
    lazy var closeBtn: UIButton = {
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage.init(named: "push_alert_close_icon"), for: .normal)
        button.addTarget(self, action: #selector(closeBtnDidClicked(sender:)), for: .touchUpInside)
        button.adjustsImageWhenHighlighted = false
        return button
    }()
    
    @objc lazy var titleLabel: UILabel = {
        let label = UILabel.init()
        label.textAlignment = NSTextAlignment.left
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 26)
        label.text = "推送没打开"
        return label
    }()
    
    @objc lazy var detailLabel: UILabel = {
        let label = UILabel.init()
        label.textAlignment = NSTextAlignment.left
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "打开推送功能，获得第一时间的消息提醒。"
        label.numberOfLines = 0
        return label
    }()
    
    lazy var confirmBtn: UIButton = {
        let button = UIButton.init(type: .custom)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitle("去设置", for: .normal)
        button.addTarget(self, action: #selector(confirmBtnDidClicked(sender:)), for: .touchUpInside)
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor.black
        return button
    }()
    
    lazy var bgImageView: UIImageView = {
        let imageView = UIImageView.init()
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.image = UIImage.init(named: "character_menu_3")
        imageView.backgroundColor = UIColor.clear
        return imageView
    }()
    
    @objc var confirmBtnDidClickedBlk: (() -> Void)?
    @objc var closeBtnDidClickedBlk: (() -> Void)?
    
    override var jk_shouldDismissOnTouchBackView: Bool {
        return true
    }
    
    deinit {
        
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.jk_presentAnimation = JKFadeInPresentAnimation.init()
        self.jk_dismissAnimation = JKFadeOutDismissAnimation.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialSubviews()
        makeSubviewsConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("viewWillLayoutSubviews view.frame:\(view.frame)")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewDidLayoutSubviews view.frame:\(view.frame)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @objc func closeBtnDidClicked(sender: UIButton) -> Void {
        jk_hide()
    }
    
    @objc func confirmBtnDidClicked(sender: UIButton) -> Void {
        if self.confirmBtnDidClickedBlk != nil {
            self.confirmBtnDidClickedBlk?()
        } else {
            let settingsUrl = URL.init(string: UIApplication.openSettingsURLString)
            if settingsUrl != nil && UIApplication.shared.canOpenURL(settingsUrl!) {
                UIApplication.shared.open(settingsUrl!, completionHandler: nil)
            }
        }
    }
    
    func initialSubviews() {
        view.backgroundColor = UIColor.red
        view.layer.cornerRadius = 6
        
        view.addSubview(lightRedBgView)
        view.addSubview(bgImageView)
        view.addSubview(closeBtn)
        view.addSubview(titleLabel)
        view.addSubview(detailLabel)
        view.addSubview(confirmBtn)
    }
    
    func makeSubviewsConstraints() {
        
        lightRedBgView.snp.makeConstraints { (maker) in
            maker.leading.trailing.top.equalTo(view)
            maker.height.equalTo(60)
        }
        
        bgImageView.snp.makeConstraints { (maker) in
            maker.centerX.equalTo(view)
            maker.size.equalTo(CGSize.init(width: 163, height: 84))
            maker.bottom.equalTo(lightRedBgView)
        }
        
        closeBtn.snp.makeConstraints { (maker) in
            maker.top.equalTo(view).offset(5)
            maker.trailing.equalTo(view).offset(-5)
            maker.size.equalTo(CGSize.init(width: 25, height: 25))
        }
        
        titleLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(lightRedBgView.snp.bottom).offset(19)
            maker.leading.equalTo(view).offset(18)
            maker.trailing.lessThanOrEqualTo(view).offset(-18)
        }
        
        detailLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(titleLabel.snp.bottom).offset(6)
            maker.leading.equalTo(view).offset(18)
            maker.trailing.equalTo(view).offset(-22)
        }
        
        confirmBtn.snp.makeConstraints { (maker) in
            maker.leading.equalTo(view).offset(33)
            maker.trailing.equalTo(view).offset(-33)
            maker.bottom.equalTo(view).offset(-24)
            maker.height.equalTo(40)
        }
    }
}
