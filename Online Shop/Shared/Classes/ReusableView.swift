//
//  ReusableView.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 13/03/23.
//


import UIKit

protocol ReusableView: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
