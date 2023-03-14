//
//  UIShowHideTextField.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 14/03/23.
//

import UIKit

class UIShowHideTextField: UITextField {
    
    let rightButton  = UIButton(type: .custom)
    
    override var isSecureTextEntry: Bool {
        didSet {
            if isFirstResponder {
                _ = becomeFirstResponder()
            }
        }
    }
    
    override func becomeFirstResponder() -> Bool {
        
        let success = super.becomeFirstResponder()
        if isSecureTextEntry, let text = self.text {
            self.text?.removeAll()
            insertText(text)
        }
        return success
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        rightButton.setImage(UIImage.appImage(.passwordNoShowed) , for: .normal)
        rightButton.tintColor = UIColor.appColor(.gray5C)
        rightButton.addTarget(self, action: #selector(toggleShowHide), for: .touchUpInside)
        rightButton.frame = CGRect(x: 0, y:0, width: 0, height: 20)
        
        rightViewMode = .always
        rightView = rightButton
        isSecureTextEntry = true
    }
    
    @objc
    func toggleShowHide(button: UIButton) {
        toggle()
    }
    
    func toggle() {
        isSecureTextEntry.toggle()
        if let textRange = textRange(from: beginningOfDocument, to: endOfDocument) { replace(textRange, withText: text!) }
        rightButton.setImage(isSecureTextEntry ? UIImage.appImage(.passwordNoShowed) : UIImage.appImage(.passwordShowed) , for: .normal)
    }
    
}
