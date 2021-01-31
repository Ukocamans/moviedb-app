//
//  LikeView.swift
//  DogApp
//
//  Created by Umurcan Kocaman on 20.12.2020.
//

import UIKit

import Core

public class LikeView: BaseView {
    
    @IBOutlet weak var viewButtonContainer: UIView!
    
    @IBOutlet weak var buttonLike: UIButton!
    
    var UIModel: MovieUIModel!
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        buttonLike.setImage(UIImage(named: "favoriteIcon"), for: .normal)
    }
    
    func setup(with UIModel: MovieUIModel) {
        self.UIModel = UIModel
        configureLike()
    }

    @IBAction func actionLike(_ sender: Any) {
        
        if UIModel.isFavorite {
            dislikeRequest()
        } else {
            likeRequest()
        }
        postNotification()
        configureLike()
    }
    
    func configureLike() {
        if UIModel.isFavorite {
            buttonLike.tintColor = .systemPink
        } else {
            buttonLike.tintColor = .lightGray
        }
    }
    
    func postNotification() {
        NotificationCenter.default.post(name: .favorite, object: nil, userInfo: nil)
    }
    
    func likeRequest() {
        let id = String(UIModel.id ?? 0)
        UserDefaultsManager.shared.storeBool(key: id, value: true)
    }
    
    func dislikeRequest() {
        let id = String(UIModel.id ?? 0)
        UserDefaultsManager.shared.remove(key: id)
    }
}
