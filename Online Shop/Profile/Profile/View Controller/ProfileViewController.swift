//
//  ProfileViewController.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 15/03/23.
//

import UIKit
import Photos
import PhotosUI

final class ProfileViewController: UIViewController, ViewSpecificController, AlertViewController {
    
    //MARK: - Root View
    typealias RootView = ProfileView
    
    //MARK: - Services
    internal var customSpinnerView = CustomSpinnerView()
    internal var coordinator: ProfileCoordinator?
    internal var isLoading: Bool = false
    
    //MARK: - Attributes
    
    //MARK: - Actions
    @IBAction func changePhotoButtonAction(_ sender: UIButton) {
        loadImage()
    }
    
    @IBAction func logoutButtonAction(_ sender: UIButton) {
        showAlertWithTwoButtons(title: "Log out", message: "Are you sure you want to log out of your account?", firstButtonText: "No", secondButtonText: "Yes") {
            self.logout()
        }
    }
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupImage()
    }
}

//MARK: - Networking

//MARK: - Other funcs
extension ProfileViewController {
    private func appearanceSettings() {
        navigationItem.title = "Profile"
        navigationController?.navigationBar.setup()
    }
    
    private func saveImage(image: UIImage) {
        guard let data = image.jpegData(compressionQuality: 0.5) else { return }
        let encoded = try! PropertyListEncoder().encode(data)
        UserDefaults.standard.set(encoded, forKey: "UserImage")
    }

    private func setupImage() {
        guard let data = UserDefaults.standard.data(forKey: "UserImage") else { return }
        let decoded = try! PropertyListDecoder().decode(Data.self, from: data)
        let image = UIImage(data: decoded)
        view().profileImageView.image = image ?? UIImage.appImage(.user)
    }
    
    private func logout() {
        KeychainAccessCheck.removelogin()
        let vc = RegistrationViewController()
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .fullScreen
        vc.coordinator = MainCoordinator(navigationController: navigationController)
        present(navigationController, animated: false)
    }
    
}

//MARK: - UIImagePickerControllerDelegate
extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private func loadImage(){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        saveImage(image: image )
        dismiss(animated: true) {
            self.setupImage()
        }
    }
}
