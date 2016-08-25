//
//  ViewController.swift
//  FBLogin
//
//  Created by Nisit Sirimarnkit on 8/23/2559 BE.
//  Copyright © 2559 Nisit Sirimarnkit. All rights reserved.
//

import UIKit
import FBSDKLoginKit


class ViewController: UIViewController {
    
    let mybutton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mybutton.setTitle("login custom", forState: .Normal)
        mybutton.backgroundColor = UIColor.redColor()
        mybutton.translatesAutoresizingMaskIntoConstraints = false
        mybutton.addTarget(self, action: #selector(btnFBLoginPressed), forControlEvents: .TouchUpInside)
        
        view.addSubview(mybutton)
        
        NSLayoutConstraint(item: mybutton, attribute: NSLayoutAttribute.CenterX , relatedBy: NSLayoutRelation.Equal , toItem: view, attribute: NSLayoutAttribute.CenterX , multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: mybutton, attribute: NSLayoutAttribute.CenterY , relatedBy: NSLayoutRelation.Equal , toItem: view, attribute: NSLayoutAttribute.CenterY , multiplier: 1, constant: 0).active = true
        NSLayoutConstraint(item: mybutton, attribute: NSLayoutAttribute.Width , relatedBy: NSLayoutRelation.Equal , toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute , multiplier: 1, constant: 200).active = true
        NSLayoutConstraint(item: mybutton, attribute: NSLayoutAttribute.Height , relatedBy: NSLayoutRelation.Equal , toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute , multiplier: 1, constant: 100).active = true
        
        
    }
    
    @IBAction func btnFBLoginPressed(sender: AnyObject) {
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logInWithReadPermissions(["email"], fromViewController: self) { (result, error) -> Void in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result
                if(fbloginresult.grantedPermissions.contains("email"))
                {
                    self.getFBUserData()
                }
            }
        }    }
    
    func getFBUserData(){
        if((FBSDKAccessToken.currentAccessToken()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).startWithCompletionHandler({ (connection, result, error) -> Void in
                if (error == nil){
                    print(result)
                }
            })
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

