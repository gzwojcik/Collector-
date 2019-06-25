//
//  CreateCollectableViewController.swift
//  Collector
//
//  Created by zgaga on 18-06-2019.
//  Copyright © 2019 Hime. All rights reserved.
//

import UIKit


//protocols
class CreateCollectableViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var pickerController = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       pickerController.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //infokey is a dictionary
        if let image = info[.originalImage] as? UIImage {
            imageView.image = image
        }
        pickerController.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func mediaFolderTapped(_ sender: Any) {
        // includes camera roll
        pickerController.sourceType = .photoLibrary
        // after clicking folder item
        present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func cameraTapped2(_ sender: Any) {
        
        // access to the camera
        pickerController.sourceType = .camera
        // after clicking folder item
        present(pickerController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func cameraTapped(_ sender: Any) {
        
        // access to the camera
        pickerController.sourceType = .camera
        // after clicking folder item
        present(pickerController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func addBtnTapped(_ sender: Any) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let collectable = Collectable (context: context)
            collectable.title = titleTextField.text
            
            //ios 12 new
            collectable.image =
                imageView.image?.jpegData(compressionQuality: 1.0)
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    

}
