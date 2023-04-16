//
//  Welcome2ViewController.swift
//  datePet
//
//  Created by Cesar Hernandez on 15/04/23.
//

import UIKit

class Welcome2ViewController: UIViewController {

    @IBAction func nextButton(_ sender: UIButton) {
        performSegue(withIdentifier: "toDashboard", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
