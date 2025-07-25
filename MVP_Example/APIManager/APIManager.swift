//
//  APIManager.swift
//  MVP_Example
//
//  Created by Prakash on 24/07/25.
//

import Foundation
protocol DataManagerProtocol    {
    func fetchData(url:String,completion:@escaping ([Product]?,Error?)->Void)
}

class APIManager : DataManagerProtocol{
    func fetchData(url: String, completion: @escaping ([Product]?, (any Error)?) -> Void) {
        guard let url = URL(string: url) else {return}
        URLSession.shared.dataTask(with: url) {  data, _, error in
            guard let data = data, error == nil else {
                completion(nil,error)
                return
            }
            do{
                let result = try JSONDecoder().decode([Product].self, from: data)
                completion(result,nil)
            }catch _{
                completion(nil,error)
            }
        }.resume()
    }
}



