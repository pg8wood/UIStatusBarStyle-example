//
//  StatusBarStyle.swift
//  StatusBarTest
//
//  Created by Patrick Gatewood on 7/27/22.
//

import UIKit

enum StatusBarStyle: CaseIterable {
    static var allCases: [StatusBarStyle] {
        var styles: [StatusBarStyle] = [.default, .light]
        if #available(iOS 13.0, *) {
            styles.append(.dark)
        }
        return styles
    }

    case `default`
    case light

    @available(iOS 13.0, *)
    case dark

    var label: String {
        switch self {
        case .default: return "Default"
        case .light: return "Light"
        case .dark: return "Dark"
        }
    }

    var value: UIStatusBarStyle {
        switch self {
        case .default:
            return .default
        case .light:
            return .lightContent
        case .dark:
            if #available(iOS 13.0, *) {
                return .darkContent
            } else {
                return .default
            }
        }
    }
}
