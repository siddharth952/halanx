//
//  SignInViewController.swift
//  halanx
//
//  Created by Siddharth Sen on 23/06/19.
//  Copyright © 2019 halfpolygon. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class SignInViewController: UIViewController, {
    
    //Constants
    let AUTH_URL = "http://testapi.halanx.com/rest-auth/login/"
    let APP_ID = ""
    
    
    
    // MARK: - Outlets
    @IBOutlet weak var logIn: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    
    
    var viewModel: SignInViewModelWithCredentials!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //viewModel.delegate = self
        setLoginButton(enabled: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
     MARK: - Actions
    
    @IBAction func credentialsChanged(_ sender: UITextField) {
        let newValue = sender.text ?? ""
        switch sender {
        case emailField:
            viewModel.email = newValue
        case passwordField:
            viewModel.password = newValue
        default: break
        }
    }
    
    @IBAction func tapOnSignInButton(_ sender: Any) {
        //viewModel.login()
    }
    
    func setLoginButton(enabled: Bool) {
        logIn.alpha = enabled ? 1 : 0.5
        logIn.isEnabled = enabled
    }
}


//MARK: - Networking

func getLoginData(url: String, parameters:[String:String]){
    
    
    
}


extension SignInViewController: SignInViewModelDelegate {
    func didUpdateCredentials() {
        setLoginButton(enabled: viewModel.hasValidCredentials)
    }

    func didUpdateState() {
        switch viewModel.state {
        case .loading:
            UIApplication.showNetworkActivity()
        case .error(let errorDescription):
            UIApplication.hideNetworkActivity()
            showMessage(title: "Error", message: errorDescription)
        case .idle:
            UIApplication.hideNetworkActivity()
        }
    }
}
