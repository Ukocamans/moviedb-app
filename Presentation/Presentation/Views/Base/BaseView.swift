//
//  BaseView.swift
//  Presentation
//
//  Created by Umurcan Kocaman on 30.01.2021.
//

import UIKit

open class BaseView: UIView {
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        xibSetup()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        xibSetup()
    }
    
}
