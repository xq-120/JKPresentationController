//
//  JKBasePresentNavigationController.swift
//  JKPresentationControllerDemo
//
//  Created by xuequan on 2020/8/30.
//  Copyright © 2020 xuequan. All rights reserved.
//

import UIKit
import JKPresentationController

class JKPresentContainerNavigationController: UINavigationController {
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        self.jk_presentAnimation = JKFadeInPresentAnimation.init()
        self.jk_dismissAnimation = JKFadeOutDismissAnimation.init()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
