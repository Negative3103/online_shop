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
//        vc.tabBarItem = UITabBarItem(title: "main".localized, image: UIImage.appImage(.main), tag: 0)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
}
