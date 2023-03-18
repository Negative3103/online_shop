//
//  MainView.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 15/03/23.
//

import UIKit

final class MainView: CustomView {
    
    //MARK: - Outlets
    @IBOutlet weak var categoryCollectionVoew: UICollectionView! {
        didSet {
            categoryCollectionVoew.register(UINib(nibName: CategoryCollectionViewCell.defaultReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.defaultReuseIdentifier)
        }
    }
    @IBOutlet weak var latestCollectionView: UICollectionView! {
        didSet {
            latestCollectionView.register(UINib(nibName: LatestCollectionViewCell.defaultReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: LatestCollectionViewCell.defaultReuseIdentifier)
        }
    }
    @IBOutlet weak var flashCollectionView: UICollectionView! {
        didSet {
            flashCollectionView.register(UINib(nibName: FlashCollectionViewCell.defaultReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: FlashCollectionViewCell.defaultReuseIdentifier)
        }
    }
}
