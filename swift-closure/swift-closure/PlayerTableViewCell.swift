//
//  PlayerTableViewCell.swift
//  swift-closure
//
//  Created by HanXujie on 16/7/27.
//  Copyright © 2016年 thinker. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var model: Player?{
        
        didSet{
            nameLabel.text = model?.name
            scoreLabel.text = "\(model?.score ?? 0)"
        }
    }
    
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
