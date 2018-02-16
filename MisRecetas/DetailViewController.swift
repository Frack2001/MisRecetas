			//
//  DetailViewController.swift
//  MisRecetas
//
//  Created by desarrollo plus on 5/2/18.
//  Copyright © 2018 desarrollo plus. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imgDetalle: UIImageView!
    
    @IBOutlet var ratingButton: UIButton!
    @IBOutlet var tableView: UITableView!
    var recipe : Recipe!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      self.imgDetalle.image = self.recipe.image
      self.tableView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.25)
      self.tableView.separatorColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.75)
      self.title = recipe.name
    
        self.tableView.estimatedRowHeight = 65.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        let image = UIImage(named: self.recipe.rating)
        self.ratingButton.setImage(image, for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        
    }
    
}

            
extension DetailViewController : UITableViewDataSource
{
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    switch section {
    case 0:
        return 3
    case 1:
        return self.recipe.ingredients.count
    case 2:
        return self.recipe.steps.count
    default:
       return 0
    }
    
    
}

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "DetailRecipeCell", for: indexPath) as! RecipeDatailViewCell
    
    
    switch indexPath.section {
    case 0:
        switch indexPath.row {
        case 0:
            cell.keyLabel.text = "Nombre: "
            cell.valueLabel.text = self.recipe.name
        case 1:
            cell.keyLabel.text = "Tiempo: "
            cell.valueLabel.text = "\(self.recipe.time!) min."
       /* case 2:
            cell.keyLabel.text = "Favorito: "
            cell.valueLabel.text = self.recipe.favorito ? "Si" : "No"
      */
             default:
            break
        }
    case 1:
        cell.keyLabel.text =  indexPath.row == 0 ? "Ingredientes" : ""
        cell.valueLabel.text = self.recipe.ingredients[indexPath.row]
    case 2:
        cell.keyLabel.text =  indexPath.row == 0 ? "Pasos a seguir" : ""
        cell.valueLabel.text = self.recipe.steps[indexPath.row]
    default:
        break
    }
    
    return cell
}
    
    @IBAction func close (segue: UIStoryboardSegue)
    {
        if let reivewVC = segue.source as? reviewViewController{
            if let ratings = reivewVC.ratingString {
                self.recipe.rating = ratings
                let image = UIImage(named: self.recipe.rating)
                self.ratingButton.setImage(image, for: .normal)
                
            }
        }
    }
    
}

        
extension DetailViewController : UITableViewDelegate
{}
            
            
