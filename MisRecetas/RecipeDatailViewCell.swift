//
//  RecipeDatailViewCell.swift
//  MisRecetas
//
//  Created by desarrollo plus on 6/2/18.
//  Copyright © 2018 desarrollo plus. All rights reserved.
//

import UIKit

class RecipeDatailViewCell: UITableViewCell {

    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var keyLabel: UILabel!
    
    var recipe : Recipe!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

