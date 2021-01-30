//
//  UIViewExtension.swift
//  Presentation
//
//  Created by Umurcan Kocaman on 30.01.2021.
//

import Foundation
import UIKit

//MARK: accessors for UIAppereance methods

@objc extension UIView {
    
    @IBInspectable
    dynamic var cornerRadius: CGFloat {
        get { return self.layer.cornerRadius }
        set (radius) { self.layer.cornerRadius = radius }
    }
    
    @IBInspectable
    dynamic var borderWidth: CGFloat {
        get { return self.layer.borderWidth }
        set (width) { self.layer.borderWidth = width }
    }
    
    @IBInspectable
    dynamic var borderColor: UIColor? {
        get {
            if let cgColor = layer.borderColor {
                return UIColor(cgColor: cgColor)
            }
            return nil
            
        }
        set { return self.layer.borderColor = newValue?.cgColor}
    }
}

//MARK: loadable nib helper

extension UIView {
    
    class var frameworkBundle:Bundle? {
        guard let url = Bundle.main.url(forResource: "Resources", withExtension: "bundle") else { return nil }
        return Bundle(url: url)
    }
    
    /// Helper method to init and setup the view from the Nib.
    func xibSetup() {
        let view = loadFromNib()
        addSubview(view)
        stretch(view: view)
    }
    
    /// Method to init the view from a Nib.
    ///
    /// - Returns: Optional UIView initialized from the Nib of the same class name.
    func loadFromNib<T: UIView>() -> T {
        
        let selfType = type(of: self)
        let bundle = UIView.frameworkBundle
        var nibName = String(describing: selfType)
        if let endIndex = nibName.firstIndex(of: "<") {
            nibName =  String(nibName.prefix(upTo: endIndex))
        }
        let nib = UINib(nibName: nibName, bundle: bundle)
        
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? T else {
            fatalError("Error loading nib with name \(nibName)")
        }
        
        return view
    }
    
    /// Stretches the input view to the UIView frame using Auto-layout
    ///
    /// - Parameter view: The view to stretch.
    func stretch(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        view.topAnchor.constraint(equalTo: topAnchor),
        view.leftAnchor.constraint(equalTo: leftAnchor),
        view.rightAnchor.constraint(equalTo: rightAnchor),
        view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
}
