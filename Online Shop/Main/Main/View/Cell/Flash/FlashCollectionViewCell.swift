//
//  FlashCollectionViewCell.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 17/03/23.
//

import UIKit

final class FlashCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var addView: UIView!
    @IBOutlet weak var favouriteView: UIView!
    
    //MARK: - Attributes
    var items: LatestModel? {
        didSet {
            guard let items = items else { return }
            
            if let image = items.imageUrl {
                imageView.setImage(with: image.checkFileLink())
            }
            
            if let category = items.category {
                categoryLabel.text = category
            }
            
            if let name = items.name {
                nameLabel.text = name
            }
            
            if let price = items.price {
                priceLabel.text = "$" + " " + String(price)
            }
            
            if let discount = items.discount {
                discountLabel.text = String(discount) + "%" + " off"
            }
        }
    }
    
    //MARK: - Lifecycles
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addView.layer.cornerRadius = addView.bounds.height / 2
        self.favouriteView.layer.cornerRadius = favouriteView.bounds.height / 2
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.cornerCurve = .continuous
    }
}
