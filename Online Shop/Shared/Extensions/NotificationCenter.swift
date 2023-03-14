//
//  NotificationCenter.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 13/03/23.
//

import Foundation

enum UserInfoName: String {
    case test
}

extension Notification.Name {
    
    func post(object: Any? = nil, userInfo: [AnyHashable : Any]? = nil) {
        NotificationCenter.default.post(name: self, object: object, userInfo: userInfo)
    }
    
    @discardableResult
    func onPost(object: Any? = nil, queue: OperationQueue? = nil, using: @escaping (Notification) -> Void) -> NSObjectProtocol {
        return NotificationCenter.default.addObserver(forName: self, object: object, queue: queue, using: using)
    }
}
