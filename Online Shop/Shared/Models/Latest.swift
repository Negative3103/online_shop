//
//  Latest.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 17/03/23.
//

import Foundation

struct LatestModel: Decodable {
    let category: String?
    let name: String?
    let price: Double?
    let imageUrl: String?
    let discount: Int?
}
