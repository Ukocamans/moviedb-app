//
//  PopularMoviesRequestModel.swift
//  Data
//
//  Created by Umurcan Kocaman on 30.01.2021.
//

import Foundation

class PopularMoviesRequestModel: Codable {
    var language: String?
    var apiKey: String?
    var page: String?
    
    enum CodingKeys: String, CodingKey {
        case language
        case apiKey = "api_key"
        case page
    }
}
