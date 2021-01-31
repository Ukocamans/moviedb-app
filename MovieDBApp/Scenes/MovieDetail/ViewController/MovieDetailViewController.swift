//
//  MovieDetailViewController.swift
//  MovieDBApp
//
//  Created by Umurcan Kocaman on 30.01.2021.
//

import UIKit

class MovieDetailViewController: UIViewController {

    var id: Int?
    @IBOutlet weak var imageViewPoster: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelVoteCount: UILabel!
    
    var viewModel: MovieDetailViewModel = MovieDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configurePage()
        
        viewModel = MovieDetailViewModel(id: id, reloadPage: { [weak self] in
            self?.configurePage()
        })
        
        viewModel.getMovieDetail()
    }
    
    func configurePage() {
        imageViewPoster.loadMovieImage(path: viewModel.image, width: viewModel.imageWidth)?.resume()
        labelTitle.text = viewModel.title
        labelDescription.text = viewModel.description
        labelVoteCount.text = viewModel.voteCount
    }
}
