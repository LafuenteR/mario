//
//  ViewController.swift
//  mario
//
//  Created by Ruel Lafuente on 8/22/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadAPI()
    }
    
    func loadAPI() {
        Network.request(URLString: GlobalVariable.apiUrl) { success, response in
            if success! {
                
            }
        } failed: { failed, response in
            print("Failed",response as Any)
        }
    }


}

