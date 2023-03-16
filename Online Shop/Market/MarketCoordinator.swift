//
//  MarketCoordinator.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 14/03/23.
//

import UIKit

final class MarketCoordinator: Coordinator {
    
    internal var childCoordinators = [Coordinator]()
    internal var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    internal func start() {
        let vc = MarketViewController()
        vc.tabBarItem = UITabBarItem(title: "", image: UIImage.appImage(.market), tag: 2)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
}
