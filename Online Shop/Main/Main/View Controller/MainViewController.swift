//
//  MainViewController.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 15/03/23.
//

import UIKit

final class MainViewController: UIViewController, ViewSpecificController, AlertViewController {
    
    //MARK: - Root View
    typealias RootView = MainView
    
    //MARK: - Services
    internal var customSpinnerView = CustomSpinnerView()
    private let viewModel = MainViewModel()
    internal var coordinator: MainCoordinator?
    internal var isLoading: Bool = false
    
    //MARK: - Attributes
    private let categoryDataProvider = CategoryDataProvider()
    private let latestDataProvider = LatestDataProvider()
    private let flashDataProvider = FlashDataProvider()
    
    //MARK: - Actions
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()
        setupNavBar()
        viewModel.getLatest()
        viewModel.getFlash()
    }
}

//MARK: - Networking
extension MainViewController: MainViewModelProtocol {
    func didFinishFetch(latest: [LatestModel]) {
        latestDataProvider.items = latest
    }
    
    func didFinishFetch(flash: [LatestModel]) {
        flashDataProvider.items = flash
    }
}

//MARK: - Other funcs
extension MainViewController {
    private func appearanceSettings() {
        viewModel.delegate = self
        navigationController?.navigationBar.setup()
        
        categoryDataProvider.viewController = self
        latestDataProvider.viewController = self
        flashDataProvider.viewController = self
        categoryDataProvider.collectionView = view().categoryCollectionVoew
        latestDataProvider.collectionView = view().latestCollectionView
        flashDataProvider.collectionView = view().flashCollectionView
    }
    
    private func setupNavBar() {
        navigationItem.title = "Trade by bata"
        
        let leftButton = UIButton(type: .system)
        leftButton.setImage(UIImage.appImage(.menu), for: .normal)
        leftButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        leftButton.sizeToFit()
        leftButton.tintColor = .black
        leftButton.isUserInteractionEnabled = false
        let leftBarButton = UIBarButtonItem(customView: leftButton)
        navigationItem.leftBarButtonItem = leftBarButton
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imageView.image = .appImage(.user)
    
        let rightButton = UIButton(type: .system)
        rightButton.frame = CGRect(x: -15, y: 40, width: 50, height: 15)
        rightButton.setImage(UIImage.appImage(.arrowDown), for: .normal)
        rightButton.setTitle("Location", for: .normal)
        rightButton.titleLabel?.font = .systemFont(ofSize: 10, weight: .regular)
        rightButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        rightButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        rightButton.setTitleColor(UIColor.black, for: .normal)
        rightButton.tintColor = UIColor.black
        rightButton.sizeToFit()
        rightButton.semanticContentAttribute = .forceRightToLeft
        
        imageView.addSubview(rightButton)
        let rightBarButton = UIBarButtonItem(customView: imageView)
        navigationItem.rightBarButtonItem = rightBarButton
    }
}
