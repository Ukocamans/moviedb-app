//
//  ViewController.swift
//  MovieDBApp
//
//  Created by Umurcan Kocaman on 30.01.2021.
//

import UIKit

class MovieListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var viewModel = MovieListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel = MovieListViewModel(reloadTable: { [weak self] in
            self?.collectionView.reloadData()
        })
        setupCollectionView()
        
        viewModel.getPopularMovies()
    }

    func setupCollectionView() {
        collectionView.register(MovieCell.self)
    }

}

extension MovieListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.setup(with: viewModel.dataSource[indexPath.row])
        return cell
    }
}

extension MovieListViewController: UICollectionViewDelegate {
    
}

extension MovieListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return viewModel.itemSize
    }
}

extension MovieListViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollViewHeight = scrollView.frame.size.height
        let scrollContentSizeHeight = scrollView.contentSize.height
        let scrollOffset = scrollView.contentOffset.y
        if !viewModel.isBusy , scrollContentSizeHeight > 0 {
            if scrollOffset + scrollViewHeight >= scrollContentSizeHeight {
                viewModel.getPopularMovies()
            }
        }
    }
}

