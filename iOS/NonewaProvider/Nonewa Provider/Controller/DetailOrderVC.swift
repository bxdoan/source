//
//  DetailOrderVC.swift
//  Nonewa Provider
//
//  Created by Doan on 12/28/17.
//  Copyright © 2017 Nonewa. All rights reserved.
//

import UIKit
import SwiftyJSON
import Foundation

class DetailOrderVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var eachOrder = JSON()
    var detailList = [JSON]()
    

    @IBOutlet weak var detailOrderTableView: UITableView!
    

    @IBOutlet weak var totalAmountLbl: UILabel!
    @IBOutlet weak var phoneNumberLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUserInfo()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        setupUserInfo()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_ORDER_STATUS, sender: nil)
    }
    override func viewDidAppear(_ animated: Bool) {
        setupUserInfo()
    }
    
    func setupUserInfo() {
        self.phoneNumberLbl.text = eachOrder["phoneNumber"].stringValue
        self.addressLbl.text = eachOrder["address"].stringValue
        self.totalAmountLbl.text = eachOrder["totalAmount"].stringValue
        debugPrint(eachOrder["details"])
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eachOrder["details"].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! DetailOrderTVCell
        cell.subTotalAmountLbl.text = eachOrder["details"][indexPath.row]["subTotalAmount"].stringValue
        cell.quantityLbl.text = eachOrder["details"][indexPath.row]["quantity"].stringValue
        cell.menuNameLbl.text = eachOrder["details"][indexPath.row]["menuName"].stringValue
        cell.priceLbl.text = eachOrder["details"][indexPath.row]["price"].stringValue
        return cell
    }
    
    // pass data back to OrderStatusVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == TO_ORDER_STATUS {
            let Des  = segue.destination as! OrderStatusVC
            Des.eachOrder = eachOrder
        }
        
    }

}
