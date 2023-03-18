//
//  CategoryCollectionViewCell.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 17/03/23.
//

import UIKit

final class CategoryCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK: - Attributes
    var items: CategoryModel? {
        didSet {
            guard let items = items else { return }
            
            if let name = items.name {
                nameLabel.text = name
            }
            
            if let image = items.image {
                imageView.image = UIImage(named: image)
            }
        }
    }
    
    //MARK: - Lifecycles
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView.layer.cornerRadius = imageView.bounds.height / 2
        self.imageView.layer.cornerCurve = .circular
    }
}
