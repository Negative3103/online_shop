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
    
    func jsonTask(url: String, requestMethod: HTTPRequestMethod, headers: [String : String]? = nil, parameters: [String : Any]? = nil, completionHandler completion: @escaping JSONTaskCompletionHandler) {
        guard let urlString: String = "\(MainConstants.link.rawValue)\(url)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = requestMethod.rawValue
        
        // Set Headers
        request.addValue(Headers.applicationJSON.rawValue, forHTTPHeaderField: Headers.contentType.rawValue)
        headers?.forEach{request.addValue($0.value, forHTTPHeaderField: $0.key)}
        
        // Set Params
        request.setJSONParameters(parameters)
        
        DispatchQueue.global(qos: .background).async {
            self.session.dataTask(with: request) { (data, response, error) in
                DispatchQueue.main.async {
                    guard let httpResponse = response as? HTTPURLResponse else {
                        completion(.Error(.requestFailed))
                        return
                    }
                    
                    guard error == nil else {
                        completion(.Error(.responseUnsuccessful))
                        return
                    }
                    
                    guard let data = data else {
                        completion(.Error(.invalidData))
                        return
                    }
                    
                    print("\n--- Start debug ---")
                    print("URL: \(url)")
                    print("Headers: \(String(describing: request.allHTTPHeaderFields))")
                    print("Parameters: \(String(describing: parameters))")
                    print("HTTPMethod: \(String(describing: request.httpMethod))")
                    print("Status Code: \(httpResponse.statusCode)")
                    
                    do {
                        let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any]
                        print("Result: \(String(describing: jsonResult))")
                        
                        switch httpResponse.statusCode {
                        case 200, 201:
                            completion(.Success(data))
                        case 500:
                            completion(.Error(.serverError))
                        default:
                            completion(.Error(.fromMessage, jsonResult?["message"] as? String))
                        }
                    } catch {
                        completion(.Error(.responseUnsuccessful))
                    }
                    
                    print("--- End debug ---\n")
                }
            }.resume()
        }
    }
}

extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}
