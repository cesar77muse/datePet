//
//  registerViewController.swift
//  datePet
//
//  Created by Cesar Hernandez on 18/03/23.
//

import UIKit

class registerViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldSetup()
    }
    
    func textFieldSetup(){
        nameTextField.leftViewMode = .always
        nameTextField.layer.cornerRadius = nameTextField.frame.size.height/2
        nameTextField.clipsToBounds = true
        
        
        let imageView = UIImageView()
        let image = UIImage(named: "name")
        imageView.image = image
        imageView.frame = CGRect(x: 5, y: 0, width: nameTextField.frame.height, height: nameTextField.frame.height)
        nameTextField.leftView = imageView
    }

}
