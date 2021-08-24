//
//  Network.swift
//  mario
//
//  Created by Ruel Lafuente on 8/24/21.
//

import Foundation
import Alamofire

class Network: NSObject {
    
    typealias complete = (Bool?,Any?)->Void
    
    //Handling Network Request
    static func request(URLString: String, successed: @escaping complete, failed: @escaping complete) {
        AF.request(URLString).responseJSON { response in
            print("Response: ", response.value)
            switch response.result {
            case .success(_):
                successed(true, response.value)
            case .failure(_):
                successed(false, response.value)
            }
        }
    }
}

