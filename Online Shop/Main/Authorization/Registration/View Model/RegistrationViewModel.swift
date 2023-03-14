//
//  RegistrationViewModel.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 14/03/23.
//

import UIKit

protocol RegistrationViewModelProtocol: ViewModelProtocol {
}

final class RegistrationViewModel {
    
    // MARK: - Attributes
    weak var delegate: RegistrationViewModelProtocol?
}
