//
//  WebController.swift
//  mario
//
//  Created by Ruel Lafuente on 8/24/21.
//

import UIKit
import WebKit

class WebController: UIViewController {

    @IBOutlet weak var imageWebView: WKWebView!
    var gameSeries: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadWebView()
    }
    
    func loadWebView() {
        self.title = GlobalVariable.webControllerTitle
        if gameSeries != "" {
            let updateString = gameSeries!.replacingOccurrences(of: " ", with: "+")
            let urlString = "\(GlobalVariable.googleUrl)\(updateString)"
            let url = URL(string: urlString)
            imageWebView.load(URLRequest(url: url!))
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
