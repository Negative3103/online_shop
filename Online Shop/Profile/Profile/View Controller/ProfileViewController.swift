//
//  ProfileViewController.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 15/03/23.
//

import UIKit

final class ProfileViewController: UIViewController, ViewSpecificController, AlertViewController {
    
    //MARK: - Root View
    typealias RootView = ProfileView
    
    //MARK: - Services
    internal var customSpinnerView = CustomSpinnerView()
//    private let viewModel = ProfileViewModel()
    internal var coordinator: ProfileCoordinator?
    internal var isLoading: Bool = false
    
    //MARK: - Attributes
    
    //MARK: - Actions
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()
    }
}

//MARK: - Networking
//extension ProfileViewController: ProfileViewModelProtocol {
//
//}

//MARK: - Other funcs
extension ProfileViewController {
    private func appearanceSettings() {
//        viewModel.delegate = self
        navigationController?.navigationBar.setup()
    }
}
