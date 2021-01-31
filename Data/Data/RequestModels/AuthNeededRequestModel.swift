//
//  AuthNeededRequestModel.swift
//  Data
//
//  Created by Umurcan Kocaman on 31.01.2021.
//

import Foundation

protocol AuthNeededRequestModel: Codable {
    var apiKey: String { get }
    
    
}

extension AuthNeededRequestModel {
    var apiKey: String {
        get {
            return "fd2b04342048fa2d5f728561866ad52a"
        }
    }
}
