//
//  MainViewController.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 15/03/23.
//

import UIKit

final class MainViewController: UIViewController, ViewSpecificController, AlertViewController {
    
    //MARK: - Root View
    typealias RootView = MainView
    
    //MARK: - Services
    internal var customSpinnerView = CustomSpinnerView()
//    private let viewModel = MainViewModel()
    internal var coordinator: MainCoordinator?
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
//extension MainViewController: MainViewModelProtocol {
//
//}

//MARK: - Other funcs
extension MainViewController {
    private func appearanceSettings() {
//        viewModel.delegate = self
        navigationController?.navigationBar.setup()
    }
}
