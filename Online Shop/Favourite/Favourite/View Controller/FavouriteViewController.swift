//
//  FavouriteViewController.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 15/03/23.
//

import UIKit

final class FavouriteViewController: UIViewController, ViewSpecificController, AlertViewController {
    
    //MARK: - Root View
    typealias RootView = FavouriteView
    
    //MARK: - Services
    internal var customSpinnerView = CustomSpinnerView()
//    private let viewModel = MainViewModel()
    internal var coordinator: FavouriteCoordinator?
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
//extension FavouriteViewController: FavouriteViewModelProtocol {
//
//}

//MARK: - Other funcs
extension FavouriteViewController {
    private func appearanceSettings() {
//        viewModel.delegate = self
        navigationController?.navigationBar.setup()
    }
}
