//
//  LoginViewController.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 14/03/23.
//

import UIKit
import CoreData

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
    private var loginArray = [String]()
    
    //MARK: - Actions
    @IBAction func loginButtonAction(_ sender: UIButton) {
        login()
    }
    
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
    
    private func login() {
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appdelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserInfo")
        fetchRequest.returnsObjectsAsFaults = false
        
        do{
            let results = try context.fetch(fetchRequest)
            for result in results as! [NSManagedObject]{
                if let login = result.value(forKey: "login") as? String{
                    self.loginArray.append(login)
                }
            }
        }
        catch{
            print("error")
        }
        
        guard let login = view().nameTextField.text , !login.isEmpty else {
            showAlert(title: "Fill all!", message: "")
            return }
        
        if loginArray.contains(login) {
            KeychainAccessCheck.saveAccount(account: Account(login: login))
            resetTabBar()
        } else {
            showAlert(title: "Not found!", message: "No account found for this login")
        }
    }
}
