//
//  UIButton.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 14/03/23.
//

import UIKit

final class Button: UIButton {
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        appearanceSettings()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        appearanceSettings()
    }
    
    func appearanceSettings() {
        self.adjustsImageWhenHighlighted = false
        self.layer.cornerCurve = .continuous
    }
    
    //MARK: - UI
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            if cornerRadius < 0 {
                layer.cornerRadius = frame.height / 2
            } else {
                layer.cornerRadius = cornerRadius
            }
        }
    }
    
    //MARK: - HighlightButton
    @IBInspectable var normalBackgroundColor: UIColor? {
        didSet {
            backgroundColor = normalBackgroundColor
        }
    }
    
    @IBInspectable var highlightedBackgroundColor: UIColor?
    
    @IBInspectable var maskedCorner: CGFloat = 3 {
        didSet {
            if maskedCorner == 1 {
                layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            } else if maskedCorner == 2 {
                layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            } else if maskedCorner == 3{
                layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner,.layerMinXMinYCorner, .layerMaxXMinYCorner]
            }
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            if oldValue == false && isHighlighted {
                highlight()
            } else if oldValue == true && !isHighlighted {
                unHighlight()
            }
        }
    }
    
    var highlightDuration: TimeInterval = 0.1
    
    private func animateBackground(to color: UIColor?, duration: TimeInterval) {
        guard let color = color else { return }
        UIView.animate(withDuration: highlightDuration) {
            self.backgroundColor = color
        }
    }
    
    func highlight() {
        animateBackground(to: highlightedBackgroundColor, duration: highlightDuration)
    }
    
    func unHighlight() {
        animateBackground(to: normalBackgroundColor, duration: highlightDuration)
    }
    
}
