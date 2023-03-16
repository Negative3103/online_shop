//
//  RegistrationView.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 14/03/23.
//

import UIKit

final class RegistrationView: CustomView {
    
    //MARK: - Outlets
    @IBOutlet weak var firstNameTextField: UITextField! {
        didSet {
            firstNameTextField.attributedPlaceholder = NSAttributedString(string: "First Name", attributes: [NSAttributedString.Key.foregroundColor : UIColor.appColor(.gray7B)])
        }
    }
    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.appColor(.gray7B)])
        }
    }
    @IBOutlet weak var lastNameTextField: UITextField! {
        didSet {
            lastNameTextField.attributedPlaceholder = NSAttributedString(string: "Last Name", attributes: [NSAttributedString.Key.foregroundColor : UIColor.appColor(.gray7B)])
        }
    }
}
