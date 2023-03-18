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
    private let viewModel = MainViewModel()
    internal var coordinator: MainCoordinator?
    internal var isLoading: Bool = false
    
    //MARK: - Attributes
    private let categoryDataProvider = CategoryDataProvider()
    private let latestDataProvider = LatestDataProvider()
    private let flashDataProvider = FlashDataProvider()
    
    //MARK: - Actions
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()
        viewModel.getLatest()
        viewModel.getFlash()
    }
}

//MARK: - Networking
extension MainViewController: MainViewModelProtocol {
    func didFinishFetch(latest: [LatestModel]) {
        latestDataProvider.items = latest
    }
    
    func didFinishFetch(flash: [LatestModel]) {
        flashDataProvider.items = flash
    }
}

//MARK: - Other funcs
extension MainViewController {
    private func appearanceSettings() {
        viewModel.delegate = self
        navigationController?.navigationBar.setup()
        
        categoryDataProvider.viewController = self
        latestDataProvider.viewController = self
        flashDataProvider.viewController = self
        categoryDataProvider.collectionView = view().categoryCollectionVoew
        latestDataProvider.collectionView = view().latestCollectionView
        flashDataProvider.collectionView = view().flashCollectionView
    }
}
