//
//  UIViewController+make.swift
//  StatusBarTest
//
//  Created by Patrick Gatewood on 7/27/22.
//

import UIKit

extension UIViewController {
    static func make<T: UIViewController>() -> T {
        UIStoryboard(name: String(describing: self), bundle: nil)
            .instantiateInitialViewController() as! T
    }
}
