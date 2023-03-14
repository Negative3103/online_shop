//
//  Account.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 14/03/23.
//

import Foundation

struct Account: Codable {
    let name: String? = nil
    let login: String?
    let accountNumber: Int?
    let email: String?
    let balanceAmount: Double? = nil
}
