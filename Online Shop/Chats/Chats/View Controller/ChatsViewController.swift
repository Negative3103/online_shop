//
//  ChatsViewController.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 15/03/23.
//

import UIKit

final class ChatsViewController: UIViewController, ViewSpecificController, AlertViewController {
    
    //MARK: - Root View
    typealias RootView = ChatsView
    
    //MARK: - Services
    internal var customSpinnerView = CustomSpinnerView()
//    private let viewModel = ChatsViewModel()
    internal var coordinator: ChatsCoordinator?
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
//extension ChatsViewController: ChatsViewModelProtocol {
//
//}

//MARK: - Other funcs
extension ChatsViewController {
    private func appearanceSettings() {
//        viewModel.delegate = self
        navigationController?.navigationBar.setup()
    }
}
