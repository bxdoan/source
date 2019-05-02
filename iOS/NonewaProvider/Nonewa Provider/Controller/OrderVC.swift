//
//  OrderVC.swift
//  Nonewa Provider
//
//  Created by Doan on 12/28/17.
//  Copyright © 2017 Nonewa. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Foundation

class OrderVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var orderTableView: UITableView!
    @IBAction func prepareForUnwindOrder(segue: UIStoryboardSegue){}
    
    var allOrders = [JSON]()
    var allDetailOrders = [JSON]()
    var myIndex = 0
    //var refreshControl : UIRefreshControl = UIRefreshControl()
    
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
        if AuthService.instance.isLoggedIn == true {
            debugPrint("doan5")
            let body: [String: Any] = [
                "sessionId": AuthService.instance.authToken,
                "placeId": UserDataService.instance.placeId
            ]
            Alamofire.request(URL_GET_ORDER_UNCOMPLETE, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
                if let value = response.result.value {
                    let json = JSON(value)
                    self.allOrders = []
                    let orders = json["orders"]
                    for (_, order) in orders {
                        self.allOrders.append(order)
                    }
                    
                    debugPrint(self.allOrders)
                    OperationQueue.main.addOperation {
                        self.orderTableView.reloadData()
                    }
                } else {
                    debugPrint(response.result.error as Any)
                }
            }
            
        } else {
            debugPrint("doan6")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allOrders.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! OrderTVCell
        cell.nameUser.text = allOrders[indexPath.row]["user"]["fullName"].stringValue
        let PM = allOrders[indexPath.row]["paymentStyleId"].intValue
        cell.paymentStyle.text = PAYMENT_STYLE_LIST[PM-1]
        let OS = allOrders[indexPath.row]["orderStatusId"].intValue
        cell.orderStatus.text = ORDER_STATUS_LIST[OS-1]
        return cell
    }
    var eachOrder = JSON()
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        eachOrder = allOrders[myIndex]
        performSegue(withIdentifier: TO_SHOW_DETAIL_ORDER, sender: self)
    }
    
    // pass data back to DetailOrderVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == TO_SHOW_DETAIL_ORDER {
            let Des  = segue.destination as! DetailOrderVC
            Des.eachOrder = eachOrder
        }

    }

}
