//
//  UIApplicationExtension.swift
//  MovieDBApp
//
//  Created by Umurcan Kocaman on 31.01.2021.
//

import Foundation
import UIKit

extension UIApplication {
    func topMostViewController() -> UIViewController? {
        return UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController?.topMostViewController()
    }
}
