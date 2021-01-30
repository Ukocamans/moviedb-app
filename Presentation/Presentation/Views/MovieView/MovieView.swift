//
//  MovieView.swift
//  Presentation
//
//  Created by Umurcan Kocaman on 30.01.2021.
//

import UIKit

public class MovieView: BaseView {
    
    @IBOutlet weak var imageViewBg: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    
    public func setup(with UIModel: MovieUIModel) {
        imageViewBg.image = UIModel.image
        labelTitle.text = UIModel.title
        labelRating.text = UIModel.rating
    }
}
