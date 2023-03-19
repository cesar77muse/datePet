//
//  ViewController.swift
//  datePet
//
//  Created by Cesar Hernandez on 10/11/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    @IBAction func registerWithEmail(_ sender: UIButton) {
    
        performSegue(withIdentifier: "emailRegistration", sender: nil)
    }
    
    
    



}

