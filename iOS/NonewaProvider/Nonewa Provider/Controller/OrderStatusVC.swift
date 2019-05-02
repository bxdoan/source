//
//  OrderStatusVC.swift
//  Nonewa Provider
//
//  Created by Doan on 1/3/18.
//  Copyright © 2018 Nonewa. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class OrderStatusVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate  {
    
    var eachOrder = JSON()
    var pick = 0

    @IBOutlet weak var orderStatusTF: UITextField!
    
    @IBOutlet weak var msgTF: UITextField!
    
    @IBOutlet weak var dropDownStatus: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
            setupUserInfo()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func okBtnPressed(_ sender: Any) {
        setOrderStatus(orderId: eachOrder["orderId"].stringValue, orderStatusId: pick, message: msgTF.text!)
        performSegue(withIdentifier: UNWINDORDER, sender: self)
    }
    
    func setupUserInfo() {
        self.dropDownStatus.isHidden = true
        let OS = eachOrder["orderStatusId"].intValue
        self.orderStatusTF.text = ORDER_STATUS_LIST[OS-1]
        debugPrint(eachOrder["details"])
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ORDER_STATUS_LIST.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == dropDownStatus {
            let titlerow = ORDER_STATUS_LIST[row]
            return titlerow
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.orderStatusTF.text = ORDER_STATUS_LIST[row]
        debugPrint(row)
        pick = row + 1
        self.dropDownStatus.isHidden = true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.orderStatusTF {
            self.dropDownStatus.isHidden = false
        }
    }
    
    //set order status
    func setOrderStatus(orderId: String, orderStatusId: Int, message: String) {
        let body: [String: Any] = [
            "sessionId": AuthService.instance.authToken,
            "orderId": orderId,
            "orderStatusId": orderStatusId,
            "mesage": message
        ]
        Alamofire.request(URL_SET_ORDER_STATUS, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON{ response in
            if let value = response.result.value {
                let json = JSON(value)
                debugPrint(json["result"])
            } else {
                debugPrint(response.result.error as Any)
            }
        }
    }

}
