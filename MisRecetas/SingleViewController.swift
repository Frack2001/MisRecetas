//
//  SingleViewController.swift
//  MisRecetas
//
//  Created by desarrollo plus on 29/1/18.
//  Copyright © 2018 desarrollo plus. All rights reserved.
//

import UIKit

class SingleViewController: UIViewController {

    
    var recipes:[Recipe] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var recipe = Recipe(name: "Tortilla", image: #imageLiteral(resourceName: "tortilla"))
        recipes.append(recipe)
        
        recipe = Recipe(name: "Pizza", image: #imageLiteral(resourceName: "pizza"))
        recipes.append(recipe)
        
        recipe = Recipe(name: "Hamburguesa", image: #imageLiteral(resourceName: "Hamburgesa"))
        recipes.append(recipe)
        
        recipe = Recipe(name: "Ensalada", image: #imageLiteral(resourceName: "ensalada"))
        recipes.append(recipe) 	
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
}


extension SingleViewController : UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellID = "RecipeCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        cell.textLabel?.text = recipe.name
        cell.imageView?.image = recipe.image
        
        return cell
    }
}
    

    

