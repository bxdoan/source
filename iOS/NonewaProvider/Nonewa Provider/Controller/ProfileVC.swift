//
//  ProfileVC.swift
//  Nonewa Provider
//
//  Created by Doan on 12/21/17.
//  Copyright © 2017 Nonewa. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ProfileVC: UIViewController {


    @IBOutlet weak var profileImage: CircleImage!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBAction func closeBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutBtnPressed(_ sender: Any) {
        UserDataService.instance.logoutUser()
        //self.profileImage.image = UIImage(data: profileDefault)
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    func setupView() {
        usernameLbl.text = UserDataService.instance.name
        Alamofire.request("\(BASE_URL)\(UserDataService.instance.imageLink)").responseImage { response in
            if let image = response.result.value {
                self.profileImage.image = image
            }
        }

        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }

}
