//
//  CustomDecoder.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 13/03/23.
//

import Foundation

final class CustomDecoder: JSONDecoder {
    override init() {
        super.init()
        keyDecodingStrategy = .convertFromSnakeCase
    }
}
