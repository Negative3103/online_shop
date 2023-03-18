//
//  LatestDataProvider.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 17/03/23.
//

import UIKit

final class LatestDataProvider: NSObject , UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: - Outlets
    weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    //MARK: - Attributes
    weak var viewController: UIViewController?
    var items = [LatestModel]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    //MARK: - Lifecycles
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
    
    //MARK: - Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LatestCollectionViewCell.defaultReuseIdentifier, for: indexPath) as? LatestCollectionViewCell else { return UICollectionViewCell() }
        cell.items = items[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let itemsCount = 3
        let calculatedWidth = width / CGFloat(itemsCount)
        return CGSize(width: calculatedWidth, height: collectionView.frame.height)
    }
}
