//
//  CAGradientLayer+Factory.swift
//  Animated_-NavigationView
//
//  Created by Sonic on 30/4/23.
//

import UIKit

extension CAGradientLayer {
    static func backgroundGradient(frame: CGRect = .zero) -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = [UIColor.backgroundColorGradient1 ?? .black, UIColor.backgroundColorGradient2 ?? .black].map { $0.cgColor }
        gradient.startPoint = .init(x: 0.5, y: 0)
        gradient.endPoint = .init(x: 0.5, y: 1)
        gradient.locations = [0.5]
        return gradient
    }
}
