//
//  UIView.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 13/03/23.
//

import UIKit

extension UIView: ReusableView { }

extension UIView {
    @IBInspectable var viewRadius: CGFloat {
        set {
            layer.masksToBounds = true
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
}
