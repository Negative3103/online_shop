//
//  LoginViewController.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 14/03/23.
//

import UIKit

protocol LoginViewControllerDelegate: NSObject {
    func login()
}

final class LoginViewController: UIViewController , AlertViewController, ViewSpecificController {
    
    //MARK: - Root View
    typealias RootView = LoginView
    
    //MARK: - Services
    internal var customSpinnerView = CustomSpinnerView()
    private let viewModel = LoginViewModel()
    internal var coordinator: MainCoordinator?
    internal var isLoading: Bool = false
    
    //MARK: - Attributes
    weak var delegate: LoginViewControllerDelegate?
    
    //MARK: - Actions
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()
    }
}

//MARK: - Networking
extension LoginViewController: LoginViewModelProtocol {
    
}

//MARK: - Other funcs
extension LoginViewController {
    private func appearanceSettings() {
        viewModel.delegate = self
        navigationController?.navigationBar.setup()
    }
}
