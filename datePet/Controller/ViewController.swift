//
//  ViewController.swift
//  datePet
//
//  Created by Cesar Hernandez on 10/11/22.
//

import UIKit
import FirebaseCore



class ViewController: UIViewController, UITextFieldDelegate{
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("congifure succes")
     
    }
    
    @IBAction func registerWithEmail(_ sender: UIButton) {
    
        performSegue(withIdentifier: "emailRegistration", sender: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        handle = Auth.auth().addStateDidChangeListener { auth, user in
//          // ...
//        }
    }
    
    @IBAction func loginButton(_ sender: Any) {
        performSegue(withIdentifier: "loginpage", sender: nil)
    }
    


}



