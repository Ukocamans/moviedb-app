//
//  MovieDetailResponseModel.swift
//  Data
//
//  Created by Umurcan Kocaman on 30.01.2021.
//

import Foundation

public struct MovieDetailResponseModel: Codable {
    public let originalTitle: String?
    public let overview: String?
    public let voteCount: Int?
    public let posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case originalTitle = "original_title"
        case overview
        case voteCount = "vote_count"
        case posterPath = "poster_path"
    }
}
