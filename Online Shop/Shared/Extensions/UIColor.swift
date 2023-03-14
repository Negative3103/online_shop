//
//  UIColor.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 13/03/23.
//

import UIKit

extension UIColor {
    static func appColor(_ name: AssetsColor) -> UIColor {
        return UIColor(named: name.rawValue) ?? .clear
    }
}
