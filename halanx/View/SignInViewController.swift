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
    let APP_ID:JSON = "0f948ebc7f620891adde46a8b1d1049cc7d56fcc"
    
    // MARK: - Outlets

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var errorLbl: UILabel!
    
    @IBOutlet weak var loginBtn: MyButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameField.layer.cornerRadius = 10.0
        usernameField.clipsToBounds = true
        
        passwordField.layer.cornerRadius = 10.0
        passwordField.clipsToBounds = true
        
        usernameField.dropShadow()
        passwordField.dropShadow()
        loginBtn.dropShadow()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
     //MARK: - Actions
    @IBAction func testbtn(_ sender: Any) {
        let username = usernameField.text
        let password = passwordField.text
        errorLbl.text = ""
        
        
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
    
    Alamofire.request(AUTH_URL, method: .post, parameters: parameters)
        .responseJSON { response in
            if response.result.isSuccess{
             
                print("Success! Got key")
                
                let KeyJSON: JSON = JSON(response.result.value!)
                print(KeyJSON)
                if(KeyJSON["key"] == self.APP_ID){ self.performSegue(withIdentifier: "toHome", sender: self)
                    
                }else{
                    self.errorLbl.text = "You do not have authorization!"
                }
            }
            else{
                print("Error \(response.result.error)")
                
            }
    }
 }
}
