//
//  LaunchScreenViewController.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 14/03/23.
//

import UIKit

final class LaunchScreenViewController: UIViewController, ViewSpecificController, AlertViewController {
    
    //MARK: - Root View
    typealias RootView = LaunchScreenView
    
    //MARK: - Services
    
    //MARK: - Actions
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            KeychainAccessCheck.isAuthed() ? self.resetTabBar() : self.pushRegistrationVC()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}

//MARK: - Other funcs
extension LaunchScreenViewController {
    private func appearanceSettings() {
        navigationController?.navigationBar.setup()
    }
    
    private func pushRegistrationVC() {
        let vc = RegistrationViewController()
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .fullScreen
        vc.coordinator = MainCoordinator(navigationController: navigationController)
        present(navigationController, animated: true)
    }
}
