//
//  PopularMoviesRequestModel.swift
//  Data
//
//  Created by Umurcan Kocaman on 30.01.2021.
//

import Foundation

public class PopularMoviesRequestModel: BaseRequestModel {
    
    public var page: String = ""
    
    public enum CodingKeys: String, CodingKey {
        case page
    }
    
    public override init() {
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        page = try container.decodeIfPresent(String.self, forKey: .page) ?? ""
        
        try super.init(from: decoder)
    }
    
    public override func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(page, forKey: .page)
        
        try super.encode(to: encoder)
    }
}
