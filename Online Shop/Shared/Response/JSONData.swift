//
//  JSONData.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 13/03/23.
//

import UIKit
import Foundation

struct JSONData<T: Decodable>: Decodable {
    let code: Int
    let message: String
    let language: String?
    let meta: Meta?
    
    let data: T?
}
