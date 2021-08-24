//
//  GameCell.swift
//  mario
//
//  Created by Ruel Lafuente on 8/24/21.
//

import UIKit
import Kingfisher

class GameCell: UITableViewCell {

    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var gameSeries: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(game: Game) {
        nameLabel.text = game.name
        gameSeries.text = game.gameSeries
        let url = URL(string: game.image)
        gameImageView.contentMode = .scaleToFill
        gameImageView.kf.setImage(with: url)
    }
    
}
