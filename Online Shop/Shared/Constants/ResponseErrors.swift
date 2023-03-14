//
//  ResponseErrors.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 13/03/23.
//

enum Result<T> {
    case Success(T)
    case Error(APIError, String? = nil)
}

enum APIError: Error {
    case requestFailed
    case invalidData
    case responseUnsuccessful
    case serverError
    case notAuthorized
    case fromMessage
    case notEnoughBalance
}
