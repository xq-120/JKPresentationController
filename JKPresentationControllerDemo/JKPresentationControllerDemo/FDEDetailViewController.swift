//
//  FDEDetailViewController.swift
//  JKPresentationControllerDemo
//
//  Created by jekyttt on 2020/3/15.
//  Copyright © 2020 jekyttt. All rights reserved.
//

import UIKit

class FDEDetailViewController: FDEBaseViewController {
    var btn: UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.frame = CGRect.init(x: 100, y: 100, width: 100, height: 44)
        btn.setTitle("button", for: .normal)
        btn.backgroundColor = .red
        btn.addTarget(self, action: #selector(btnDidClicked(_:)), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(btn)
        btn.center = self.view.center
    }
    
    @objc func btnDidClicked(_ sender: UIButton) {
        if navigationController != nil {
            navigationController?.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
    
}

