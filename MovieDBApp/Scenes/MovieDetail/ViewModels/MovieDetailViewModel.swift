//
//  MovieDetailViewModel.swift
//  MovieDBApp
//
//  Created by Umurcan Kocaman on 30.01.2021.
//

import Foundation

class MovieDetailViewModel {
    var image: String = ""
    var voteCount: String = ""
    var title: String = ""
    var description: String = ""
    
    let id: String
    
    var reloadPage: (()->Void)?
    
    init() {
        id = ""
    }
    
    init(id: String?) {
        self.id = id ?? ""
    }
    
    func getMovieDetail() {
        
    }
}
