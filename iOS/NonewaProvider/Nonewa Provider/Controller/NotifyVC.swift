//
//  NotifyVC.swift
//  Nonewa Provider
//
//  Created by Doan on 1/3/18.
//  Copyright © 2018 Nonewa. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NotifyVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var notifyList = JSON()

    @IBOutlet weak var notifyTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUserInfo()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        setupUserInfo()
    }
    
    func setupUserInfo() {
//        NSTimer* myTimer = [NSTimer scheduledTimerWithTimeInterval: 60.0 target: self
//            selector: @selector(callAfterSixtySecond:) userInfo: nil repeats: YES];
        if AuthService.instance.isLoggedIn == true {
            debugPrint("doan5")
            Alamofire.request("\(URL_GET_NOTIFIES)?sessionId=\(AuthService.instance.authToken)&count=\(3)", encoding: JSONEncoding.default ).responseJSON { response in
                if let value = response.result.value {
                    let json = JSON(value)
                    self.notifyList = json["notifies"]
                    debugPrint(json["notifies"])
                    
                    OperationQueue.main.addOperation {
                        self.notifyTV.reloadData()
                    }
                } else {
                    debugPrint(response.result.error as Any)
                }
            }
            
        } else {
            debugPrint("errror, NOT login")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifyList.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! NotifyTVCell
        let eachNoti = notifyList[indexPath.row]
        cell.notiLbl.text = message(eachNoti: eachNoti)
        cell.dayTime.text = day(eachNoti: eachNoti)
        return cell
    }
    
    func day (eachNoti: JSON) -> String {
        debugPrint(eachNoti)
        var time = ""
        let type = eachNoti["type"]
        if type == 2 {
            time = eachNoti["obj"]["dateString"].stringValue
        } else
        {
           time = eachNoti["obj"]["createDate"].stringValue
        }
        return time
    }
    
    func message (eachNoti: JSON) -> String {
        debugPrint(eachNoti)
        var notifyString = ""
        if eachNoti["type"] == 2 {
            if eachNoti["type"]["obj"]["status"].intValue == 0 {
                notifyString = "Địa điểm \"" + eachNoti["obj"]["name"].stringValue + "\" đang online"
            } else {
                notifyString = "Địa điểm \"" + eachNoti["obj"]["name"].stringValue + "\" đang offline"
            }
        } else //if eachNoti["type"] == 4
        {
            notifyString = "Bạn đang có đơn hàng"
        }
        return notifyString
    }

}
