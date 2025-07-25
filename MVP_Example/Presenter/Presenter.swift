//
//  Presenter.swift
//  MVP_Example
//
//  Created by Prakash on 24/07/25.
//
import Foundation

//protocol

protocol ViewDelegate:AnyObject {
    func showResult(_ result:Codable)
    func showError(_ error:String)
}
protocol DataPresenter {
    func getData()
}

class ProductPresenter : DataPresenter{
    let dataManager : DataManagerProtocol
    weak var viewDelegate : ViewDelegate?
    
    init(dataManager: DataManagerProtocol,viewDelegate : ViewDelegate) {
        self.dataManager = dataManager
        self.viewDelegate = viewDelegate
    }
    func getData(){
        dataManager.fetchData(url: Constant.strURL) { [weak self] product, error in
            if let product = product{
                self?.viewDelegate?.showResult(product as Codable)
            }else{
                self?.viewDelegate?.showError(error!.localizedDescription)
            }
        }
    }
}






