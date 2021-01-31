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
    
    @IBOutlet weak var viewLike: LikeView!
    
    var dataTask: URLSessionDataTask?
    
    var UIModel: MovieUIModel!
    
    public func prepareForReuse() {
        dataTask?.cancel()
        dataTask = nil
        imageViewBg.image = nil
        NotificationCenter.default.removeObserver(self, name: .favorite, object: nil)
    }
    
    public func setup(with UIModel: MovieUIModel) {
        self.UIModel = UIModel
        dataTask = imageViewBg.loadMovieImage(path: UIModel.image, width: UIModel.width)
        dataTask?.resume()
        labelTitle.text = UIModel.title
        labelRating.text = UIModel.rating
        viewLike.setup(with: UIModel)
        NotificationCenter.default.addObserver(self, selector: #selector(favoriteNotification(_:)), name: .favorite, object: nil)
    }
    
    @objc func favoriteNotification(_ notification: Notification) {
        guard let id = notification.userInfo?["id"] as? Int,
              id == UIModel.id
        else { return }
        
        viewLike.setup(with: UIModel)
    }
}
