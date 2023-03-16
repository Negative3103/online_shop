//
//  ProfileView.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 15/03/23.
//

import UIKit

final class ProfileView: CustomView {
    
    //MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.text = KeychainAccessCheck.login()
        }
    }
    @IBOutlet weak var profileImageView: UIImageView! {
        didSet {
            profileImageView.layer.cornerRadius = profileImageView.bounds.height / 2
        }
    }
    @IBOutlet var images: [UIImageView]! {
        didSet {
            images.forEach({ images in
                images.layer.cornerRadius = images.bounds.height / 2
            })
        }
    }
}
