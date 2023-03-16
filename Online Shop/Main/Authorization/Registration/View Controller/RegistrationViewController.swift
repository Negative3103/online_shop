//
//  RegistrationViewController.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 14/03/23.
//

import UIKit
import CoreData

final class RegistrationViewController: UIViewController , AlertViewController, ViewSpecificController {
    
    //MARK: - Root View
    typealias RootView = RegistrationView
    
    //MARK: - Services
    internal var customSpinnerView = CustomSpinnerView()
    private let viewModel = RegistrationViewModel()
    internal var coordinator: MainCoordinator?
    internal var isLoading: Bool = false
    
    //MARK: - Attributes
    private var loginArray = [String]()
    
    //MARK: - Actions
    @IBAction func buttonAction(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            registration()
        case 1:
            coordinator?.pushLoginVC(viewController: self)
        default: break
        }
    }
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()
    }
}

//MARK: - Networking
extension RegistrationViewController: RegistrationViewModelProtocol {
    
}

//MARK: - Other funcs
extension RegistrationViewController {
    private func appearanceSettings() {
        viewModel.delegate = self
        navigationController?.navigationBar.setup()
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func registration() {
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appdelegate.persistentContainer.viewContext
        let login = NSEntityDescription.insertNewObject(forEntityName: "UserInfo", into: context)
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
        
        guard let firstName = view().firstNameTextField.text , !firstName.isEmpty , let email = view().emailTextField.text , let lastName = view().lastNameTextField.text, !lastName.isEmpty else {
            showAlert(title: "Fill all!", message: "")
            return
        }
        
        guard isValidEmail(email) else {
            showAlert(title: "Enter the correct mail format", message: "")
            return
        }
        
        if loginArray.contains(firstName) {
            showAlert(title: "A user with the same name already exists", message: "")
        } else {
            login.setValue(firstName, forKey: "login")
            KeychainAccessCheck.saveAccount(account: Account(login: firstName, accountNumber: Int(lastName), email: email))
            resetTabBar()
        }
    }
}

//MARK: - LoginDelegate
extension RegistrationViewController: LoginViewControllerDelegate {
    func login() {
        resetTabBar()
    }
}
