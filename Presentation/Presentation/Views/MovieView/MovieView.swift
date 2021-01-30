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
    
    var dataTask: URLSessionDataTask?
    
    public func prepareForReuse() {
        dataTask?.cancel()
        dataTask = nil
        imageViewBg.image = nil
    }
    
    public func setup(with UIModel: MovieUIModel) {
        dataTask = imageViewBg.loadMovieImage(path: UIModel.image, width: 200)
        dataTask?.resume()
        labelTitle.text = UIModel.title
        labelRating.text = UIModel.rating
    }
}
