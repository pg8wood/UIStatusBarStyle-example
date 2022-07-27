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

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    @IBAction func didSelectPushNavigationControllerButton(_ sender: Any) {
        let navigationController = StatusBarRespectingNavigationController(rootViewController: NavStackStatusBarViewController.make())
        navigationController.navigationBar.prefersLargeTitles = true
        presentModal(navigationController)
    }

    @IBAction func didSelectPresentViewControllerButton(_ sender: UIButton) {
       presentModal(ExampleStatusBarStylingViewController.make())
    }

    /// Presents a modal view vontroller and makes this view controller the presentation controller's delegate.
    /// This allows us to respond when the modal is dismissed and refresh the preferred status bar style
    /// to this view controller's preferred style.
    private func presentModal(_ viewController: UIViewController) {
        viewController.presentationController?.delegate = self
        present(viewController, animated: true)
    }
}

extension ViewController: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        setNeedsStatusBarAppearanceUpdate()
    }
}

class StatusBarRespectingNavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        topViewController?.preferredStatusBarStyle ?? .default
    }
}
