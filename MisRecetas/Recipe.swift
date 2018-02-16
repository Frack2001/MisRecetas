//
//  Recipe.swift
//  MisRecetas
//
//  Created by desarrollo plus on 29/1/18.
//  Copyright © 2018 desarrollo plus. All rights reserved.
//

import UIKit
import Foundation


class Recipe: NSObject{
    var name:String!
    var image:UIImage!
    var time:Int!
    var ingredients:[String]!
    var steps:[String]!
    //var favorito:Bool = false
    var rating : String = "rating"
    
    
    init(name:String, image:UIImage,time:Int,ingredients:[String],steps:[String]!) {
        self.name = name
        self.image = image
        self.time = time
        self.ingredients = ingredients
        self.steps = steps    }
}
