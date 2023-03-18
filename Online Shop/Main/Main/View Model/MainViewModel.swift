//
//  MainViewModel.swift
//  Online Shop
//
//  Created by Хасан Давронбеков on 17/03/23.
//

import UIKit

protocol MainViewModelProtocol: ViewModelProtocol {
    func didFinishFetch(latest: [LatestModel])
    func didFinishFetch(flash: [LatestModel])
}

final class MainViewModel {
    
    // MARK: - Attributes
    weak var delegate: MainViewModelProtocol?
    
    internal func getLatest() {
        delegate?.showActivityIndicator()
        JSONDownloader.shared.jsonTask(url: EndPoint.latest.rawValue, requestMethod: .get, completionHandler: { [weak self]  (result) in
            guard let self = self else { return }
            switch result {
            case .Error(let error):
                self.delegate?.showAlertClosure(error: error)
            case .Success(let json):
                do {
                    let fetchedData = try CustomDecoder().decode(JSONLatest<[LatestModel]>.self, from: json)
                    self.delegate?.didFinishFetch(latest: fetchedData.latest)
                } catch {
                    self.delegate?.showAlertClosure(error: (APIError.invalidData, nil))
                }
            }
            self.delegate?.hideActivityIndicator()
        })
    }
    
    internal func getFlash() {
        delegate?.showActivityIndicator()
        JSONDownloader.shared.jsonTask(url: EndPoint.flash.rawValue, requestMethod: .get, completionHandler: { [weak self]  (result) in
            guard let self = self else { return }
            switch result {
            case .Error(let error):
                self.delegate?.showAlertClosure(error: error)
            case .Success(let json):
                do {
                    let fetchedData = try CustomDecoder().decode(JSONFlash<[LatestModel]>.self, from: json)
                    self.delegate?.didFinishFetch(flash: fetchedData.flashSale)
                } catch {
                    self.delegate?.showAlertClosure(error: (APIError.invalidData, nil))
                }
            }
            self.delegate?.hideActivityIndicator()
        })
    }
}
