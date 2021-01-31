//
//  MovieDetailViewModel.swift
//  MovieDBApp
//
//  Created by Umurcan Kocaman on 30.01.2021.
//

import Foundation

import Data

class MovieDetailViewModel {
    let imageWidth = 342
    
    var image: String?
    var voteCount: String?
    var title: String?
    var description: String?
    
    let id: Int
    
    var reloadPage: (()->Void)?
    
    init() {
        id = 0
    }
    
    init(id: Int?, reloadPage: (()->Void)?) {
        self.reloadPage = reloadPage
        self.id = id ?? 0
    }
    
    func getMovieDetail() {
        let request = MovieDetailRequest(id: id)
        let requestModel = MovieDetailRequestModel()
        requestModel.apiKey = "fd2b04342048fa2d5f728561866ad52a"
        requestModel.language = "en-US"
        
        request.send(reqModel: requestModel) { [weak self] (result) in
            switch result {
            case .success(let model):
                self?.configurePage(with: model)
                self?.reloadPage?()
            case .failure(let error):
                dump(error)
            case .empty:
                print("empty")
            }
        }
    }
    
    func configurePage(with model: MovieDetailResponseModel?) {
        image = model?.posterPath
        title = model?.originalTitle
        description = model?.overview
        voteCount = "Total Vote Count: \(model?.voteCount ?? 0)"
    }
}
