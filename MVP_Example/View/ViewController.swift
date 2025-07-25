//
//  ViewController.swift
//  MVP_Example
//
//  Created by Prakash on 24/07/25.
//

import UIKit

class ViewController: UIViewController ,ViewDelegate{
    var dataPresenter : ProductPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        dataPresenter = ProductPresenter(dataManager: APIManager(), viewDelegate: self)
        dataPresenter.getData()
    }
    func showResult(_ result: any Codable) {
        print(result)
    }
    
    func showError(_ error: String) {
        print(error)
    }
}
