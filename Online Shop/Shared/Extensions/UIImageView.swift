//
//  UIImageView.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 17/03/23.
//

import UIKit
import SDWebImage

extension UIImageView {
    func setImage(with url: URL) {
        if url == URL(fileURLWithPath: "") {
        } else {
            self.sd_setImage(with: url)
        }
    }
}
