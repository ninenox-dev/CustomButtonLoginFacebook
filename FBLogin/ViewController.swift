//
//  ViewController.swift
//  FBLogin
//
//  Created by Nisit Sirimarnkit on 8/23/2559 BE.
//  Copyright © 2559 Nisit Sirimarnkit. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let buttonLogin : FBSDKLoginButton = FBSDKLoginButton()
        buttonLogin.center = self.view.center
        buttonLogin.readPermissions = ["email"]
        view.addSubview(buttonLogin)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

