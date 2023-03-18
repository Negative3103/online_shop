//
//  CategoryDataProvider.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 17/03/23.
//

import UIKit

final class CategoryDataProvider: NSObject , UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: - Outlets
    weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    //MARK: - Attributes
    weak var viewController: UIViewController?
    var items = [CategoryModel(name: "Phones", image: "phone") , CategoryModel(name: "Headphones" , image: "headphones") , CategoryModel(name: "Games", image: "game"), CategoryModel(name: "Cars", image: "car"), CategoryModel(name: "Furniture", image: "bad"), CategoryModel(name: "Kids", image: "robot")]
    
    //MARK: - Lifecycles
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
    
    //MARK: - Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.defaultReuseIdentifier, for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
        cell.items = items[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: collectionView.frame.height)
    }
}
