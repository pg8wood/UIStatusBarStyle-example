//
//  StatusBarStylingViewController.swift
//  StatusBarTest
//
//  Created by Patrick Gatewood on 7/26/22.
//

import UIKit

class StatusBarStylingViewController: UIViewController {
    @IBOutlet weak var segmentedControl: UISegmentedControl!

    private var statusBarStyle: StatusBarStyle = .default {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        statusBarStyle.value
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        StatusBarStyle.allCases.enumerated().forEach { index, item in
            segmentedControl.setTitle(item.label, forSegmentAt: index)
        }
    }

    @IBAction func didSelectStatusBarStyle(_ sender: UISegmentedControl) {
        statusBarStyle = StatusBarStyle.allCases[sender.selectedSegmentIndex]
    }
}
