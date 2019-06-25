//
//  CollectableTableViewController.swift
//  Collector
//
//  Created by zgaga on 18-06-2019.
//  Copyright © 2019 Hime. All rights reserved.
//

import UIKit

class CollectableTableViewController: UITableViewController {
    
    var collectables:[Collectable] = []
    
   override func viewWillAppear(_ animated: Bool) {
        getCollectables()
    }
    
    func getCollectables() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            //sprobuje odczytac
            if let collectablesFromCoreData = try? context.fetch(Collectable.fetchRequest()){
                if let tempCollectables = collectablesFromCoreData as? [Collectable]{
                    self.collectables = tempCollectables
                    //reload data
                    tableView.reloadData()
                }
            }
            
            
        }
        
    }

    

    // MARK: - Table view data source


    
    //how many
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return collectables.count
    }

    //what goes inside
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        
         let collectable = collectables[indexPath.row]
        cell.textLabel?.text = collectable.title
        if let data = collectable.image {
            // knowersja z object image optional na imageView
                    cell.imageView?.image = UIImage(data: data)
        }
        // Configure the cell...

        return cell
    }
    
    
    // deselect object
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
   
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //if user tries to delete an object
        if editingStyle == .delete{
            
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                let collectable = collectables[indexPath.row]
                context.delete(collectable)
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                // have to reload the list
                getCollectables()
                
                
            }
            
            
            
        }
    }
    
    // what happens when an item is selected, segue is performed
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedCollectable = collectables[indexPath.row]
        
        performSegue(withIdentifier: "MoveToCollectableDetails", sender: selectedCollectable)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let collectableDetailsVC = segue.destination as? CollectableDetailsViewController {
            
            if let selectedCollectable = sender as? Collectable{
                collectableDetailsVC.selectedCollectable = selectedCollectable
                
            }
            
            
            
        }
    }
    
}
