//
//  LoginVC.swift
//  Nonewa Provider
//
//  Created by Doan on 12/16/17.
//  Copyright © 2017 Nonewa. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()

        // Do any additional setup after loading the view.
    }
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        
        guard let username = usernameTxt.text , usernameTxt.text != "" else  { return }
        guard let password = passwordTxt.text , passwordTxt.text != "" else  { return }
        
        AuthService.instance.loginUser(userName: username, password: password) { (success) in
            if success {
                AuthService.instance.findUserBySessionId(completion: { (success) in
                    if success {
                        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                        self.spinner.isHidden = true
                        self.spinner.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                    }
                })
            }
        }
    }
    
    
    func setUpView() {
        spinner.isHidden = true
    }
    


}
