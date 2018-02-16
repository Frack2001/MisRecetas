//
//  RecipeCell.swift
//  MisRecetas
//
//  Created by desarrollo plus on 30/1/18.
//  Copyright © 2018 desarrollo plus. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {

    @IBOutlet var imagen: UIImageView!
    @IBOutlet var nombre: UILabel!
    @IBOutlet var ingredientes: UILabel!
    @IBOutlet var tiempo: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
