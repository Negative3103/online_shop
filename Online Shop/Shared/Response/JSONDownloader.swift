//
//  JSONDownloader.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 13/03/23.
//

import UIKit

protocol SessionProtocol {
    func dataTask(with urlRequest: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: SessionProtocol {}

struct JSONDownloader {
    
    private init() {}
    
    static let shared = JSONDownloader()
    
    internal var session: SessionProtocol = URLSession.shared
    
    private let isDebug = true
    
    typealias JSONTaskCompletionHandler = (Result<Data>) -> ()
}
