//
//  registerViewController.swift
//  datePet
//
//  Created by Cesar Hernandez on 18/03/23.
//

import UIKit
import FirebaseAuth

class registerViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    var passwordMessage = UIAlertController(title: "Attention", message: "Las contraseñas no coinciden", preferredStyle: .alert)
    var charactersMessage = UIAlertController(title: "Attention", message: "La contraseña debe tener al menos 6 caracteres", preferredStyle: .alert)
    var registerProblem = UIAlertController(title: "Attention", message: "Ha ocurrido un error intentando crear tu cuenta, intenta nuevamente", preferredStyle: .alert)
    let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
      })
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nameImage = UIImage(named:"name")
        addLeftImageTo(txtField: nameTextField, andImage: nameImage!)
        addLeftImageTo(txtField: dateTextField, andImage: nameImage!)
        addLeftImageTo(txtField: phoneTextField, andImage: nameImage!)
        addLeftImageTo(txtField: passwordTextField, andImage: nameImage!)
        addLeftImageTo(txtField: repeatPasswordTextField, andImage: nameImage!)
        
        
        
    }
    
    @IBAction func createAccount(_ sender: UIButton) {
        if let email = nameTextField.text, let password = passwordTextField.text,let Rpassword = repeatPasswordTextField.text {
            if password == Rpassword{
                if password.count > 6 {
                    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                        if let e = error {
                            self.registerProblem.addAction(self.ok)
                            self.present(self.registerProblem, animated: true, completion: nil)
                            print(e)
                        }
                        else {
                            //Navigate to the ChatViewController
                            self.performSegue(withIdentifier: "phoneValidator", sender: self)
                        }
                        
                    }
                }
                
                else{
                    charactersMessage.addAction(ok)
                    self.present(charactersMessage, animated: true, completion: nil)
                }
            }
            else{
                passwordMessage.addAction(ok)
                self.present(passwordMessage, animated: true, completion: nil)
            }
            
        }
        
        
    }
    
    
    func addLeftImageTo(txtField: UITextField, andImage img: UIImage) {
        //           let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
        //           leftImageView.image = img
        //           txtField.leftView = leftImageView
        //           txtField.leftViewMode = .always
        txtField.layer.cornerRadius = txtField.frame.size.height/2
        txtField.clipsToBounds = true
    }
    
    
    
 
    
    @IBAction func cancelCreation(_ sender: UIButton) {
        //performSegue(withIdentifier: "cancelEmailRegistration", sender: self)
        self.dismiss(animated: true)
    }
}
