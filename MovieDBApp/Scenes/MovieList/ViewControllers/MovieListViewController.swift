//
//  ViewController.swift
//  MovieDBApp
//
//  Created by Umurcan Kocaman on 30.01.2021.
//

import UIKit

class MovieListViewController: UIViewController {

    @IBOutlet weak var textFieldSearch: UITextField!
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
        
        self.hideKeyboardWhenTappedAround()
    }

    func setupCollectionView() {
        collectionView.register(MovieCell.self)
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            
            guard let controller = segue.destination as? MovieDetailViewController,
                  let id = sender as? Int else { return }
            
            controller.id = id
            
        }
    }
    
    @IBAction func textChanged(_ sender: Any) {
        viewModel.search(text: textFieldSearch.text)
        viewModel.reloadTable?()
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: viewModel.dataSource[indexPath.row].id)
    }
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

