//
//  UINavigationBar.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 14/03/23.
//

import UIKit

extension UINavigationBar {
    func setup() {
        barStyle = .default
        barTintColor = UIColor.black
        tintColor = UIColor.black
        titleTextAttributes = [.foregroundColor: UIColor.black]
        largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        UIBarButtonItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.clear], for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.clear], for: .highlighted)
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
    }
    
    func clear() {
        shadowImage = UIImage()
        setBackgroundImage(UIImage(), for: .default)
    }
    
    func reset() {
        shadowImage = nil
        setBackgroundImage(nil, for: .default)
    }
}

class BackBarButtonItem: UIBarButtonItem {
    @available(iOS 14.0, *)
    override var menu: UIMenu? {
        set {}
        get {
            return super.menu
        }
    }
}
