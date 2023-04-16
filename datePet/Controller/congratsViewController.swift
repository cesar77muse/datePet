//
//  congratsViewController.swift
//  datePet
//
//  Created by Cesar Hernandez on 12/04/23.
//

import UIKit

class congratsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func ContinueButton(_ sender: Any) {
        performSegue(withIdentifier: "phonesuccesful", sender: self)
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
