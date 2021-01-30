//
//  PopularMoviesResponseModel.swift
//  Data
//
//  Created by Umurcan Kocaman on 30.01.2021.
//

import Foundation

public struct PopularMoviesResponseModel: Codable {
    public let page: Int?
    public let results: [MovieModel]?
    public let totalPages, totalResults: Int?

    public enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
