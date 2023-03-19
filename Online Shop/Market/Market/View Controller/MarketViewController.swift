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

//MARK: - Other funcs
extension MarketViewController {
    private func appearanceSettings() {
        navigationItem.title = "Market"
        navigationController?.navigationBar.setup()
    }
}
