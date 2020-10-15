//
//  FDETaskItem.swift
//  JKPresentationControllerDemo
//
//  Created by xq on 2020/10/15.
//  Copyright © 2020 xuequan. All rights reserved.
//

import UIKit

class FDETaskItem: NSObject {
    var title: String = ""
    var didClickedBlk: (() -> Void)?
}
