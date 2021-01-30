//
//  MovieCell.swift
//  MovieDBApp
//
//  Created by Umurcan Kocaman on 30.01.2021.
//

import UIKit

import Presentation

class MovieCell: UICollectionViewCell {

    @IBOutlet weak var viewMovie: MovieView!
    
    override func prepareForReuse() {
        viewMovie.prepareForReuse()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setup(with UIModel: MovieUIModel) {
        viewMovie.setup(with: UIModel)
    }

}
