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

//MARK: - Other funcs
extension ChatsViewController {
    private func appearanceSettings() {
        navigationItem.title = "Chats"
        navigationController?.navigationBar.setup()
    }
}
