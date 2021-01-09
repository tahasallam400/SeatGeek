//
//  NetworkManager.swift
//  SeatGeek
//
//  Created by TAHA SALLAM on 1/7/21.
//

import Foundation
import Moya

let networkManager:NetworkManager = NetworkManager()

protocol Networkable {

    var provider:MoyaProvider<MyService>{get}
    func Events(client_id: String, client_secret: String,completion: @escaping (EventList?, Error?) -> ())
    
}

class NetworkManager: Networkable {
    
    
    
    var provider: MoyaProvider<MyService> = MoyaProvider<MyService>()
    
   func Events(client_id: String, client_secret: String, completion: @escaping (EventList?, Error?) -> ()) {
        
        provider.request(.Events(client_id: client_id, client_secret:client_secret)) { result in
            // do something with the result (read on for more details)
            
            switch result {
               case .failure(let error):
                   completion(nil, error)
               case .success(let value):
                   let decoder = JSONDecoder()
                   do {
                       let posts = try decoder.decode(EventList.self, from: value.data)
                       completion(posts, nil)
                   } catch let error {
                       completion(nil, error)
                   }
               }
        }
        
    }
    
    
}
