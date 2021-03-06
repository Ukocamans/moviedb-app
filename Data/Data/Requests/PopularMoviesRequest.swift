//
//  PopularMoviesRequest.swift
//  Data
//
//  Created by Umurcan Kocaman on 30.01.2021.
//

import Foundation
import Core

public class PopularMoviesRequest:NetworkRequest<PopularMoviesRequestModel,PopularMoviesResponseModel> {
    public override init() {
        super.init()
        self.endpoint = "/3/movie/popular"
        self.httpMethod = .get
    }
}
