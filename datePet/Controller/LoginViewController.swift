//
//  LoginViewController.swift
//  datePet
//
//  Created by Cesar Hernandez on 12/04/23.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var passwordData: UITextField!
    
    @IBOutlet weak var userData: UITextField!
    @IBOutlet weak var googleLogin: UIButton!
    @IBOutlet weak var faceBookLogin: UIButton!
    @IBOutlet weak var appleLogin: UIButton!
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
    }
    
    
    @IBAction func GoogleLogin(_ sender: Any) {
    }
    @IBAction func FacebookLogin(_ sender: Any) {
     }
     @IBAction func AppleLogin(_ sender: Any) {
     }
     @IBAction func registerButton(_ sender: Any) {
         performSegue(withIdentifier: "registerpage", sender: nil)
     }
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
   

}
