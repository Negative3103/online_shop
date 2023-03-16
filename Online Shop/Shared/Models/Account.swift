//
//  Account.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 14/03/23.
//

import Foundation

struct Account: Codable {
    let login: String?
    var accountNumber: Int? = nil
    var email: String? = nil
}
