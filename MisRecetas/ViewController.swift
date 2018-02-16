//
//  ViewController.swift
//  MisRecetas
//
//  Created by desarrollo plus on 29/1/18.
//  Copyright © 2018 desarrollo plus. All rights reserved.
//


import UIKit

class ViewController: UITableViewController {

    
    var recipes:[Recipe] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
      
        
        
        
        var recipe = Recipe(name: "Tortilla", image: #imageLiteral(resourceName: "tortilla"),time: 10,ingredients:["patatas", "Huevos","Cebolla","Aceite"],steps:["Pelar patatass","batir huevos","Freir patatas","mezclar patas, huevo y cebolla"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Pizza", image: #imageLiteral(resourceName: "pizza"), time: 8, ingredients:["Base de pizza","Tomáte","Jamón york", "Peperoni", "Queso rayado"], steps:["Echar los ingredientes encima de la base","Meter en el horno"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Hamburguesa con queso fundido", image: #imageLiteral(resourceName: "Hamburgesa"), time: 12, ingredients:["Carne picada","Pan de hamburguesa","Bacon","Queso en lonchas"], steps:["Hacer filete de hamburguesa con la carne picada","freir la carne y poner el queso encima","montar la hamburguesa"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Ensalada", image: #imageLiteral(resourceName: "ensalada"), time: 3 , ingredients:["Huevo","Lechuga","Tomáte","Atún"], steps:["Mezclar todos los ingredientes"])
        recipes.append(recipe)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
        
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let recipe = recipes[indexPath.row]
        let cellID = "RecipeCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RecipeCell

        cell.nombre.text = recipe.name
        cell.imagen.image = recipe.image
        cell.tiempo.text = "\(recipe.time!) minutos"
        cell.ingredientes.text = "\(recipe.ingredients.count) ingredientes"
        //cell.accessoryType = recipe.favorito ? .checkmark : .none
        
        //self.tableView.reloadData()
        
        cell.imagen.layer.cornerRadius = 41.0
        cell.imagen.clipsToBounds = true
        
        return cell
    
    }
    
    
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let compartirAction = UITableViewRowAction(style: .default, title: "Compartir") { (action, indexPath) in
            
            let TxtCompartir = "Compartir \(self.recipes[indexPath.row].name) "
            
            let activityController = UIActivityViewController(activityItems: [TxtCompartir, self.recipes[indexPath.row].image], applicationActivities: nil)
            
           self.present(activityController, animated: true, completion: nil)
        }
        
        compartirAction.backgroundColor = UIColor(red: 30.0/255.0, green: 166.0/255.0, blue: 253.0/255.0, alpha: 1)
        
        
        let borrarAction = UITableViewRowAction(style: .default, title: "Borrar") { (action, indexPath) in
            
            self.recipes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
        
         borrarAction.backgroundColor = UIColor(red: 125/255.0, green: 66/255.0, blue: 88/255.0, alpha: 1)
         return [compartirAction, borrarAction]
        
    }
    
    
  
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        /*
        let alertaClick = UIAlertController(title: nil, message: "Valora este plato", preferredStyle: .alert)
    
        let cancelAlerta = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        let celda =  self.recipes[indexPath.row]
        
        var tituloFavorito = "Favorito"
        var estiloFavorito = UIAlertActionStyle.default
        
        if celda.favorito
        {
             tituloFavorito = "No favorito"
        estiloFavorito = UIAlertActionStyle.destructive
        }
        
        let favoritoAlerta = UIAlertAction(title: tituloFavorito, style: estiloFavorito) { (alerta) in
           
            celda.favorito = !celda.favorito
            self.tableView.reloadData()
        }
        
        alertaClick.addAction(cancelAlerta)
        alertaClick.addAction(favoritoAlerta)
        
        self.present(alertaClick, animated: true, completion: nil)*/
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeDetail"
        {
            if let indexPath = self.tableView.indexPathForSelectedRow
            {
                let selectRecipe = self.recipes[indexPath.row]
                let destinationViewController = segue.destination as! DetailViewController
                destinationViewController.recipe = selectRecipe
            }
            
            
        }
    }
    
    
   
}

