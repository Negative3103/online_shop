//
//  Meta.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 13/03/23.
//

import Foundation

struct Meta: Codable {
    let itemsPerPage: Int?
    let totalItems: Int?
    let currentPage: Int?
    let totalPages: Int?
}
