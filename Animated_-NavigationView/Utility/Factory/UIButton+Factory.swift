//
//  UIButton+Factory.swift
//  Animated_-NavigationView
//
//  Created by Sonic on 30/4/23.
//

import UIKit

extension UIButton {
    static func closeButton() -> UIButton {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "CloseButton"), for: .normal)
        return button
    }
}
