//
//  AlertViewController.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 13/03/23.
//

import UIKit

protocol AlertViewController {
    func addErrorAlertView(error: (APIError, String?), completion: (() -> ())?)
    func showAlert(title: String, message: String, buttonAction: (()->())?)
    func showAlertWithTwoButtons(title: String, message: String, firstButtonText: String, firstButtonAction: (()->())?, secondButtonText: String, secondButtonAction: (()->())?)
}

extension AlertViewController where Self: UIViewController {
    func addErrorAlertView(error: (APIError, String?), completion: (() -> ())? = nil) {
        switch error.0 {
        case .requestFailed:
            showAlert(title: AlertViewTitles.noInternetConnection.rawValue, message: AlertViewSubtitles.noInternetConnectionDetail.rawValue, buttonAction: nil)
        case .notAuthorized:
            showAlert(title: AlertViewTitles.noAuthorizationTitle.rawValue, message: AlertViewSubtitles.noAuthorizationMessage.rawValue, buttonAction: nil)

        case .fromMessage:
            guard let message = error.1 else { return }
            showAlert(title: message, message: "", buttonAction: nil)
        default:
            showAlert(title: AlertViewTitles.serverError.rawValue, message: AlertViewSubtitles.serverErrorDetail.rawValue, buttonAction: nil)
        }
    }
    
    func showAlert(title: String, message: String, buttonAction: (()->())? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: { (action) in
            buttonAction?()
        }))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func showAlertWithTwoButtons(title: String, message: String, firstButtonText: String, firstButtonAction: (()->())? = nil, secondButtonText: String, secondButtonAction: (()->())? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: firstButtonText, style: UIAlertAction.Style.default, handler: { (action) in
            firstButtonAction?()
        }))
        alert.addAction(UIAlertAction(title: secondButtonText, style: UIAlertAction.Style.default, handler: { (action) in
            secondButtonAction?()
        }))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func showAlertWithTextField(title: String, message: String, buttonAction: ((_ text: String?) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addTextField { (textField) in
            textField.keyboardType = .numberPad
        }
        alert.addAction(UIAlertAction(title: "continue", style: UIAlertAction.Style.default, handler: { (action) in
            guard let textField =  alert.textFields?.first else {
                buttonAction?(nil)
                return
            }
            buttonAction?(textField.text)
        }))
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func showAlertDestructive(title: String? = nil, message: String? = nil, preferredStyle: UIAlertController.Style = .actionSheet, buttonTitle: String, _ buttonAction: (() -> Void)? = nil) {
        var preferredStyle = preferredStyle
        if (UIDevice.current.userInterfaceIdiom == .pad) { preferredStyle = UIAlertController.Style.alert }
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: buttonTitle, style: .destructive, handler: { _ in
            buttonAction?()
        }))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}
