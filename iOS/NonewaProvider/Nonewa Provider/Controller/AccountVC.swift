//
//  AccountVC.swift
//  Nonewa Provider
//
//  Created by Doan on 12/16/17.
//  Copyright © 2017 Nonewa. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class AccountVC: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var userImage: CircleImage!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}

    var labelShowPlacesBtn = String()
    @IBOutlet weak var showPlacesBtn: UIButton!
    @IBAction func showPlacesBtnPressed(_ sender: Any) {
        
        performSegue(withIdentifier: TO_PLACES, sender: nil)
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        if AuthService.instance.isLoggedIn {
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        NotificationCenter.default.addObserver(self, selector: #selector(AccountVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        setupUserInfo()
    }

    @objc func userDataDidChange(_ notif: Notification) {
        setupUserInfo()
    }

    func setupUserInfo() {
        if AuthService.instance.isLoggedIn {
            debugPrint("doan1")
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            if labelShowPlacesBtn == "" {
                showPlacesBtn.setTitle("Bạn đang offline", for: .normal)
            } else {
                showPlacesBtn.setTitle(labelShowPlacesBtn, for: .normal)
            }
            Alamofire.request("\(BASE_URL)\(UserDataService.instance.imageLink)").responseImage { response in
                if let image = response.result.value {
                    self.userImage.image = image
                }
            }

        } else {
            debugPrint("doan2")
            showPlacesBtn.setTitle("Bạn đang offline", for: .normal)
            loginBtn.setTitle("Đăng nhập", for: .normal)
            userImage.image = UIImage(named: "menuProfileIcon")
        }
    }
    

}

