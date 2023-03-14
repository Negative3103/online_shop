//
//  TabbarController.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 14/03/23.
//

import UIKit

final class TabBarController: UITabBarController {
    
    // MARK: - Attributes
    internal let mainCoordinator = MainCoordinator(navigationController: UINavigationController())
    internal var catalogCoordinator = FavouriteCoordinator(navigationController: UINavigationController())
    internal var searchCoordinator = MarketCoordinator(navigationController: UINavigationController())
    internal var libraryCoordinator = ChatsCoordinator(navigationController: UINavigationController())
    internal var profileCoordinator = ProfileCoordinator(navigationController: UINavigationController())
    
    // MARK: - Lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        createControllers()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createControllers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()
    }
    
}

// MARK: - Other funcs
extension TabBarController {
    private func createControllers() {
        mainCoordinator.start()
        catalogCoordinator.start()
        searchCoordinator.start()
        libraryCoordinator.start()
        profileCoordinator.start()
        
        viewControllers = [mainCoordinator.navigationController,
                           catalogCoordinator.navigationController,
                           searchCoordinator.navigationController,
                           libraryCoordinator.navigationController,
                           profileCoordinator.navigationController]
    }
    
    private func appearanceSettings() {
        tabBar.setup()
    }
}
