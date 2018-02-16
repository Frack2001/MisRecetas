//
//  reviewViewController.swift
//  MisRecetas
//
//  Created by desarrollo plus on 8/2/18.
//  Copyright © 2018 desarrollo plus. All rights reserved.
//

import UIKit

class reviewViewController: UIViewController {

    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var thirdButton: UIButton!
    
    @IBOutlet var stackBotones: UIStackView!
    @IBOutlet var backgroundImage: UIImageView!
   
    
    
    
    @IBAction func close(_ sender: Any) {
   navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImage.addSubview(blurEffectView)
        
        let escalado = CGAffineTransform(scaleX: 0, y: 0)
        let translation = CGAffineTransform(translationX: 0, y: 500)
        
        firstButton.transform = escalado.concatenating(translation)
 
        secondButton.transform = escalado.concatenating(translation)

        thirdButton.transform = escalado.concatenating(translation)// Combina escalado con traslacion.
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 4, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
            self.firstButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: {(success) in
            UIView.animate(withDuration: 3, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
            self.secondButton.transform = CGAffineTransform(scaleX: 1, y: 1) }, completion:  {(success) in
                UIView.animate(withDuration: 2, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
                    self.thirdButton.transform = CGAffineTransform(scaleX: 1, y: 1)
                }, completion: nil)}
                )})
     
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override var prefersStatusBarHidden: Bool {
        return true
    }
   
    var ratingString : String?
    
    @IBAction func ratingPress(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            ratingString = "dislike"
        case 2:
            ratingString = "good"
        case 3:
            ratingString = "great"
        default:
            break
        }
        
        performSegue(withIdentifier: "unwindToDetailView", sender: sender)
    }
}
