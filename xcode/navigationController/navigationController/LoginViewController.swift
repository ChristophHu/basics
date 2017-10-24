//
//  LoginViewController.swift
//  navigationController
//
//  Created by Christoph Huschenhöfer on 22.10.17.
//  Copyright © 2017 Christoph Hu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBAction func loginButton(_ sender: UIButton) {
        let mainNavigationViewController = storyboard?.instantiateViewController(withIdentifier: "MainNavigationController") as! MainNavigationController
        
        present(mainNavigationViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}
