//
//  ChatsCoordinator.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 14/03/23.
//

import UIKit

final class ChatsCoordinator: Coordinator {
    
    internal var childCoordinators = [Coordinator]()
    internal var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    internal func start() {
        let vc = ChatsViewController()
        vc.tabBarItem = UITabBarItem(title: "", image: UIImage.appImage(.chats), tag: 3)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
}
