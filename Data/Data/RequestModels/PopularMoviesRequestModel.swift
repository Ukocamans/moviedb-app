//
//  PopularMoviesRequestModel.swift
//  Data
//
//  Created by Umurcan Kocaman on 30.01.2021.
//

import Foundation

public class PopularMoviesRequestModel: Codable {
    
    public init() { }
    
    public var language: String?
    public var apiKey: String?
    public var page: String?
    
    public enum CodingKeys: String, CodingKey {
        case language
        case apiKey = "api_key"
        case page
    }
}
