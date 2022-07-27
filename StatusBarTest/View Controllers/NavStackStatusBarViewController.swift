//
//  NavStackStatusBarViewController.swift
//  StatusBarTest
//
//  Created by Patrick Gatewood on 7/26/22.
//

import UIKit

class NavStackStatusBarViewController: StatusBarStylingViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        StatusBarStyle.allCases.enumerated().forEach { index, item in
            segmentedControl.setTitle(item.label, forSegmentAt: index)
        }
    }
}
