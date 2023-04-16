//
//  ViewController.swift
//  datePet
//
//  Created by Cesar Hernandez on 10/11/22.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn



class ViewController: UIViewController, UITextFieldDelegate{
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //FirebaseApp.configure()
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
        self.dismiss(animated: true)
    }
    
    @IBAction func FacebookRegister(_ sender: Any) {
    }
    
    @IBAction func GoogleRegister(_ sender: Any) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] result, error in
          guard error == nil else {
            print("error")
              return
          }

          guard let user = result?.user,
            let idToken = user.idToken?.tokenString
          else {
            print("error2")
              return
          }

          let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                         accessToken: user.accessToken.tokenString)

            Auth.auth().signIn(with: credential) { result, error in

                self.performSegue(withIdentifier: "successRegister", sender: self)
            }
        }
        
    }
    
    @IBAction func AppleRegister(_ sender: Any) {
    }
}



