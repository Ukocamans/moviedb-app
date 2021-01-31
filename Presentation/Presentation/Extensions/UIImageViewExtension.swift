//
//  UIImageViewExtension.swift
//  Presentation
//
//  Created by Umurcan Kocaman on 30.01.2021.
//

import Foundation
import UIKit

public extension UIImageView {
    
    func imageFromServerURL(urlString: String, placeHolderImage:UIImage? = UIImage(named: "poster-placeholder")) -> URLSessionDataTask? {
        
        if self.image == nil{
            self.image = placeHolderImage
        }

        return URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in

            if error != nil {
                print(error ?? "No Error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })

        })
    }
    
    func loadMovieImage(path: String?, width: Int?) -> URLSessionDataTask?  {
        let domain = "https://image.tmdb.org/t/p/"
        let url = domain + "w\(width ?? 0)" + (path ?? "")
        return imageFromServerURL(urlString: url)
    }
    
}
