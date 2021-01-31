//
//  LoadingManager.swift
//  MovieDBApp
//
//  Created by Umurcan Kocaman on 31.01.2021.
//

import Foundation
import UIKit

class LoadingManager {
    static let shared = LoadingManager()
    
    var loadingVC: UIViewController?
    
    init() { }
    
    func show() {
        loadingVC = LoadingViewController()
        loadingVC?.modalPresentationStyle = .overCurrentContext
        loadingVC?.modalTransitionStyle = .crossDissolve
        
        let controller = UIApplication.shared.topMostViewController()
        controller?.present(loadingVC ?? LoadingViewController(), animated: true, completion: nil)
    }
    
    func dismiss() {
        loadingVC?.dismiss(animated: true, completion: nil)
        loadingVC = nil
    }
}
