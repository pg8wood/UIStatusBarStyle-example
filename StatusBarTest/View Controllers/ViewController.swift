//
//  ViewController.swift
//  StatusBarTest
//
//  Created by Patrick Gatewood on 7/26/22.
//

import UIKit

class ViewController: StatusBarStylingViewController {
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var navigationControllerButton: UIButton!

    override var preferredStatusBarStyle: UIStatusBarStyle {
        // Use this instead of the childForStatusBarStyle--this is far more
        // straightforward!
        presentedViewController?.preferredStatusBarStyle ?? super.preferredStatusBarStyle
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // This IS required if you want modals to be able to control the status
        // bar appearance.
        modalPresentationCapturesStatusBarAppearance = true
    }

    @IBAction func didSelectPushNavigationControllerButton(_ sender: Any) {
        let navigationController = StatusBarRespectingNavigationController(rootViewController: NavStackStatusBarViewController.make())
        navigationController.navigationBar.prefersLargeTitles = true
        present(navigationController, animated: true)
    }

    @IBAction func didSelectPresentViewControllerButton(_ sender: UIButton) {
       present(ExampleStatusBarStylingViewController.make(), animated: true)
    }

}

class StatusBarRespectingNavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        topViewController?.preferredStatusBarStyle ?? .default
    }
}
