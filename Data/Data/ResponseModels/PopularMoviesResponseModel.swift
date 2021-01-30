//
//  PopularMoviesResponseModel.swift
//  Data
//
//  Created by Umurcan Kocaman on 30.01.2021.
//

import Foundation

struct PopularMoviesResponseModel: Codable {
    let page: Int?
    let results: [MovieModel]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
