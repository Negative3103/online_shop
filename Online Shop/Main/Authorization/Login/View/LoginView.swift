//
//  LoginView.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 14/03/23.
//

import UIKit

final class LoginView: CustomView {
    
    //MARK: - Outlets
    @IBOutlet weak var nameTextField: UITextField! {
        didSet {
            nameTextField.attributedPlaceholder = NSAttributedString(string: "First name", attributes: [NSAttributedString.Key.foregroundColor : UIColor.appColor(.gray7B)])
        }
    }
    @IBOutlet weak var passwordTextField: UIShowHideTextField! {
        didSet {
            passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.appColor(.gray7B)])
        }
    }
}
