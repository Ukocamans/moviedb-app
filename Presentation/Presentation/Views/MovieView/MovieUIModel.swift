//
//  MovieUIModel.swift
//  Presentation
//
//  Created by Umurcan Kocaman on 30.01.2021.
//

import Foundation
import UIKit

import Data

public class MovieUIModel {
    
    public var image: UIImage?
    public var title: String?
    public var rating: String?
    
    public init(model: MovieModel) {
        title = model.originalTitle
        rating = "\(model.voteAverage ?? 0.0)"
    }
}
