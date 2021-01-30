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
    
    func getPopularMovies() {
        let request = PopularMoviesRequest()
        let requestModel = PopularMoviesRequestModel()
        requestModel.language = "en-US"
        page += 1
        requestModel.page = "\(page)"
        requestModel.apiKey = "fd2b04342048fa2d5f728561866ad52a"
        request.send(reqModel: requestModel) { [weak self] (result) in
            switch result {
            case .success(let model):
                self?.dataSource += self?.createDataSource(movies: model.results ?? []) ?? []
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
