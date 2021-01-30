//
//  MovieDetailRequest.swift
//  Data
//
//  Created by Umurcan Kocaman on 30.01.2021.
//

import Foundation
import Core

public class MovieDetailRequest:NetworkRequest<MovieDetailRequestModel,MovieDetailResponseModel> {
    public init(id: Int) {
        super.init()
        self.endpoint = "/3/movie/\(id)"
        self.httpMethod = .get
    }
}
