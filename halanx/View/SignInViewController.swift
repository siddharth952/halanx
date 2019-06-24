//
//  SignInViewController.swift
//  halanx
//
//  Created by Siddharth Sen on 23/06/19.
//  Copyright © 2019 halfpolygon. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SignInViewController: UIViewController {
    
    //Constants
    let AUTH_URL = "http://testapi.halanx.com/rest-auth/login/"
    let APP_ID = ""
    

    
    // MARK: - Outlets

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
     //MARK: - Actions
    @IBAction func testbtn(_ sender: Any) {
        let username = usernameField.text
        let password = passwordField.text
        
        if(username == "" || password == ""){
            return
        }
        Login(username!,password!)
    }
    
//MARK: - Networking
func Login(_ user:String,_ pwd:String){
    
    let parameters: Parameters = [
        "email": "",
        "username": "\(user)",
        "password": "\(pwd)"
    ]
    
    Alamofire.request("http://testapi.halanx.com/rest-auth/login/", method: .post, parameters: parameters)
        .responseJSON { response in
            if response.result.isSuccess{
                print("Success! Got key")
                
                let KeyJSON: JSON = JSON(response.result.value!)
                print(KeyJSON)
            }
            else{
                print("Error \(response.result.error)")
                
            }
            
            
            
    }
    
 }
    
    
    
}
