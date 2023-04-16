//
//  LoginViewController.swift
//  datePet
//
//  Created by Cesar Hernandez on 12/04/23.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

class LoginViewController: UIViewController {
    
    var modelUserData = UserData(userEmail: "", password: "")
    
    @IBOutlet weak var passwordData: UITextField!
    
    @IBOutlet weak var userData: UITextField!
    @IBOutlet weak var googleLogin: UIButton!
    @IBOutlet weak var faceBookLogin: UIButton!
    @IBOutlet weak var appleLogin: UIButton!
    
    var emptyFormMessage = UIAlertController(title: "Attention", message: "Debes ingresar usuario y contraseña", preferredStyle: .alert)
    var userNotFound = UIAlertController(title: "Attention", message: "Usuario o contraseña incorrectos, verifica la información ingresada", preferredStyle: .alert)
    let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
      })
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

       configureButtons()
    }
    
    func configureButtons(){
        appleLogin.layer.cornerRadius = 0.5 * appleLogin.bounds.size.width
        appleLogin.clipsToBounds = true
        
        faceBookLogin.layer.cornerRadius = 0.5 * faceBookLogin.bounds.size.width
        faceBookLogin.clipsToBounds = true
        
        googleLogin.layer.cornerRadius = 0.5 * googleLogin.bounds.size.width
        googleLogin.clipsToBounds = true
        
        userData.layer.cornerRadius = userData.frame.size.height/2
        userData.clipsToBounds = true
        passwordData.layer.cornerRadius = passwordData.frame.size.height/2
        passwordData.clipsToBounds = true
    }
    
    @IBAction func loginButton(_ sender: Any) {
        if let user = userData.text, let password = passwordData.text{
            Auth.auth().signIn(withEmail: user, password: password) { authResult, error in
                if let e = error {
                    self.userNotFound.addAction(self.ok)
                    self.present(self.userNotFound, animated: true, completion: nil)
                    print(e)
                }
              print("succesfull login")
            }
        }
        else{
            userNotFound.addAction(ok)
            self.present(userNotFound, animated: true, completion: nil)
        }
        
    }
    
    
    @IBAction func GoogleLogin(_ sender: Any) {
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
                
                performSegue(withIdentifier: "successLogin", sender: self)
            }
        }
    }
    @IBAction func FacebookLogin(_ sender: Any) {
     }
     @IBAction func AppleLogin(_ sender: Any) {
     }
     @IBAction func registerButton(_ sender: Any) {
         performSegue(withIdentifier: "registerpage", sender: self)
     }
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
   

}
