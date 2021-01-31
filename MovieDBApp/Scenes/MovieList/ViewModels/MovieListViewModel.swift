//
//  MovieListViewModel.swift
//  MovieDBApp
//
//  Created by Umurcan Kocaman on 30.01.2021.
//

import Foundation
import UIKit

import Data
import Presentation

fileprivate struct Constants {
    static let spacing: CGFloat = 10.0
}

class MovieListViewModel {
    
    var dataSource: [MovieUIModel] = []
    var allDataSource: [MovieUIModel] = []
    var isBusy = false
    var page = 0
    
    init() { }
    
    init(reloadTable: (()-> Void)?) {
        self.reloadTable = reloadTable
    }
    
    var numberOfItems: Int {
        return dataSource.count
    }
    
    var itemSize: CGSize {
        let size = (UIScreen.width / 2) - Constants.spacing
        
        return CGSize(width: size, height: size)
    }
    
    var reloadTable: (()-> Void)?
    
    func search(text: String?) {
        if text == nil || text == "" {
            isBusy = false
            dataSource = allDataSource
        } else {
            isBusy = true
            dataSource = allDataSource.filter({ (model) -> Bool in
                guard let loweredText = text?.lowercased(),
                      let title = model.title?.lowercased() else { return false }
                return title.starts(with: loweredText)
            })
            dataSource.sort { (model1, model2) -> Bool in
                model1.title ?? "" < model2.title ?? ""
            }
        }
    }
    
    func getPopularMovies() {
        let request = PopularMoviesRequest()
        let requestModel = PopularMoviesRequestModel()
        page += 1
        requestModel.page = "\(page)"
        request.send(reqModel: requestModel) { [weak self] (result) in
            switch result {
            case .success(let model):
                self?.allDataSource += self?.createDataSource(movies: model.results ?? []) ?? []
                self?.search(text: nil)
                self?.reloadTable?()
            case .failure(let error):
                dump(error)
            case .empty:
                print("empty")
            }
        }
    }
    
    func createDataSource(movies: [MovieModel]) -> [MovieUIModel] {
        var UIModels: [MovieUIModel] = []
        for movie in movies {
            let UIModel = MovieUIModel(model: movie)
            UIModels.append(UIModel)
        }
        return UIModels
    }
}
