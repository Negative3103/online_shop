//
//  UITabbar.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 14/03/23.
//

import UIKit

extension UITabBar {
    func setup() {
        tintColor = UIColor.appColor(.gray90)
        backgroundColor = .white
        layer.maskedCorners = [.layerMaxXMinYCorner , .layerMinXMinYCorner]
        clipsToBounds = true
        layer.cornerRadius = 24
        
    }
}
