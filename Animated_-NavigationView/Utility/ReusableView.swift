//
//  ReusableView.swift
//  Animated_-NavigationView
//
//  Created by Sonic on 30/4/23.
//

import Foundation

public protocol ReusableView {
    static var reuseIdentifier: String { get }
}

public extension ReusableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
