//
//  ViewController.swift
//  navigationController
//
//  Created by Christoph Huschenhöfer on 22.10.17.
//  Copyright © 2017 Christoph Hu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func logoutHandler(_ sender: UIBarButtonItem) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

