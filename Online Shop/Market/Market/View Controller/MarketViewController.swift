//
//  MarketViewController.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 15/03/23.
//

import UIKit

final class MarketViewController: UIViewController, ViewSpecificController, AlertViewController {
    
    //MARK: - Root View
    typealias RootView = MarketView
    
    //MARK: - Services
    internal var customSpinnerView = CustomSpinnerView()
//    private let viewModel = MarketViewModel()
    internal var coordinator: MarketCoordinator?
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
//extension MarketViewController: MarketViewModelProtocol {
//
//}

//MARK: - Other funcs
extension MarketViewController {
    private func appearanceSettings() {
//        viewModel.delegate = self
        navigationController?.navigationBar.setup()
    }
}
