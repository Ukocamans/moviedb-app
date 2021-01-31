//
//  MovieDetailViewController.swift
//  MovieDBApp
//
//  Created by Umurcan Kocaman on 30.01.2021.
//

import UIKit

import Presentation

class MovieDetailViewController: UIViewController {

    var id: Int?
    @IBOutlet weak var imageViewPoster: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelVoteCount: UILabel!
    
    var viewLike: LikeView?
    
    var viewModel: MovieDetailViewModel = MovieDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configurePage()
        
        viewModel = MovieDetailViewModel(id: id, reloadPage: { [weak self] in
            self?.configurePage()
        })
        
        
        configureNavigation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.getMovieDetail()
    }
    
    func configureNavigation() {
        viewLike = LikeView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: viewLike ?? UIView())
    }
    
    func configurePage() {
        imageViewPoster.loadMovieImage(path: viewModel.image, width: viewModel.imageWidth)?.resume()
        labelTitle.text = viewModel.title
        labelDescription.text = viewModel.description
        labelVoteCount.text = viewModel.voteCount
        viewLike?.setup(with: id ?? 0, and: viewModel.isFavorite)
    }
}
