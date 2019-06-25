//
//  CollectableDetailsViewController.swift
//  Collector
//
//  Created by zgaga on 25-06-2019.
//  Copyright © 2019 Hime. All rights reserved.
//

import UIKit

class CollectableDetailsViewController: UIViewController {
    
    var selectedCollectable : Collectable = Collectable ()
    
    @IBOutlet weak var CollectableDetailsImageView: UIImageView!
    
    @IBOutlet weak var collectableDetailsTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        
       
        
        if let data = selectedCollectable.image {
            // knowersja z object image optional na imageView
            CollectableDetailsImageView.image = UIImage(data: data)
        }
        
        collectableDetailsTextField.text = selectedCollectable.title
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
