//
//  MainCoordinator.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 14/03/23.
//

import UIKit

final class MainCoordinator: Coordinator {
    
    internal var childCoordinators = [Coordinator]()
    internal var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
//        let vc = MainViewController()
//        vc.tabBarItem = UITabBarItem(title: "main".localized, image: UIImage.appImage(.main), tag: 0)
//        vc.coordinator = self
//        navigationController.pushViewController(vc, animated: false)
    }
    
    func pushLoginVC(viewController: UIViewController) {
        let vc = LoginViewController()
        if let viewController = viewController as? RegistrationViewController {
            vc.delegate = viewController
        }
        vc.coordinator = self
        navigationController.present(vc, animated: true)
    }
}
