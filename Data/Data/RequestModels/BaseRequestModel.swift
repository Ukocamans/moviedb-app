//
//  BaseRequestModel.swift
//  Data
//
//  Created by Umurcan Kocaman on 31.01.2021.
//

import Foundation

public class BaseRequestModel: Codable {
    
    public init() { }
    
    public var language: String = "en-US"
    public var apiKey: String = "fd2b04342048fa2d5f728561866ad52a"
    
    public enum CodingKeys: String, CodingKey {
        case language
        case apiKey = "api_key"
    }
}
