//
//  JKPresentationController.swift
//  UIPresentationController_demo
//
//  Created by jekyttt on 2019/3/13.
//  Copyright © 2019 jekyttt. All rights reserved.
//

import UIKit

class JKPresentationController: UIPresentationController {
    
    deinit {
        
    }
    
    @objc lazy var backView: UIView = {
        let view = UIView.init()
        let tapGes = UITapGestureRecognizer.init(target: self, action: #selector(backViewDidClicked(sender:)))
        view.addGestureRecognizer(tapGes)
        return view
    }()
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        backView.backgroundColor = presentedViewController.jk_backViewBgColor
    }
    
    @objc func backViewDidClicked(sender: UIView) -> Void {
        presentedViewController.view.endEditing(true)
        if presentedViewController.jk_shouldDismissOnTouchBackView {
            presentedViewController.jk_hide(withAnimated: true, completion: nil)
        }
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        return presentedViewController.jk_presentedViewFrame
    }
    
    override func presentationTransitionWillBegin() {
        containerView?.addSubview(backView)
        backView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: backView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: containerView,
                           attribute: .leading,
                           multiplier: 1.0,
                           constant: 0.0).isActive = true

        NSLayoutConstraint(item: backView,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: containerView,
                           attribute: .trailing,
                           multiplier: 1.0,
                           constant: 0.0).isActive = true
        
        NSLayoutConstraint(item: backView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: containerView,
                           attribute: .top,
                           multiplier: 1.0,
                           constant: 0.0).isActive = true
        
        NSLayoutConstraint(item: backView,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: containerView,
                           attribute: .bottom,
                           multiplier: 1.0,
                           constant: 0.0).isActive = true

        backView.alpha = 0
        let duration = presentedViewController.jk_presentAnimation?.transitionDuration(using: nil) ?? 0.35
        UIView.animate(withDuration: duration) {
            self.backView.alpha = 1
        }
    }
    
    override func presentationTransitionDidEnd(_ completed: Bool) {
        
    }
    
    override func dismissalTransitionWillBegin() {
        let duration = presentedViewController.jk_dismissAnimation?.transitionDuration(using: nil) ?? 0.25
        UIView.animate(withDuration: duration) {
            self.backView.alpha = 0
        }
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            backView.removeFromSuperview()
        }
    }
}

