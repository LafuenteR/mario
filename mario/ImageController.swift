//
//  ImageController.swift
//  mario
//
//  Created by Ruel Lafuente on 8/24/21.
//

import UIKit
import Kingfisher

class ImageController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var image: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadImage()
    }
    
    func loadImage() {
        self.title = GlobalVariable.fullImage
        let url = URL(string: image!)
        imageView.contentMode = .scaleToFill
        imageView.kf.setImage(with: url)
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
