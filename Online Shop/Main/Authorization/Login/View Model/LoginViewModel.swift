//
//  LoginViewModel.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 14/03/23.
//

import UIKit

protocol LoginViewModelProtocol: ViewModelProtocol {
}

final class LoginViewModel {
    
    // MARK: - Attributes
    weak var delegate: LoginViewModelProtocol?
}
