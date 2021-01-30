//
//  ReusableView.swift
//  Presentation
//
//  Created by Umurcan Kocaman on 30.01.2021.
//

import Foundation
import UIKit

public protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    public static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}

extension UIView: ReusableView { }
