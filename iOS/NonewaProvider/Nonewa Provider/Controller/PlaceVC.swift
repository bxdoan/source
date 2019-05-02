//
//  PlaceVC.swift
//  Nonewa Provider
//
//  Created by Doan on 12/27/17.
//  Copyright © 2017 Nonewa. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Foundation

class PlaceVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var placeTableView: UITableView!
    
    
    var allPlaces = ["Bạn đang offline"]
    var myIndex = 0
    var myPlace = String()
    var myPlaceId = String()
    var placeJS = JSON()
    var labelShowPlacesBtn = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUserInfo()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUserInfo() {
        if AuthService.instance.isLoggedIn == true {
            debugPrint("doan3")
            Alamofire.request("\(URL_GET_PLACES_STATUS)?SessionId=\(AuthService.instance.authToken)", encoding: JSONEncoding.default).responseJSON { (response) in
                if let value = response.result.value {
                    let json = JSON(value)
                    let places = json["places"]
                    self.placeJS = places
                    debugPrint(places)
                    for (_, place) in places {
                        let name = place["name"].stringValue
                        if place["status"] == 0 {
                            let string1 = name + " - offline"
                            self.allPlaces.append(string1)
                        }
                        else {
                            let string2 = name + " - online"
                            self.allPlaces.append(string2)
                        }
                    }
                    debugPrint(self.allPlaces)
                    OperationQueue.main.addOperation {
                        self.placeTableView.reloadData()
                    }
                } else {
                    debugPrint(response.result.error as Any)
                }
            }
            
        } else {
            debugPrint("doan4")
            
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPlaces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PlaceTVCell
        cell.placeName.text = allPlaces[indexPath.row]
        return cell
    }
    
    // show place is online
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        let split = allPlaces[myIndex].split(separator: " ")
        let lastword = String(split.suffix(1).joined(separator: [" "]))
        if lastword == "online" {
            myPlace = allPlaces[0]
        } else if myIndex == 0 {
            setPlaceStatus(sessionId: AuthService.instance.authToken, placeId: UserDataService.instance.placeId, status: "0")
            UserDataService.instance.setPlaceId(placeId: "")
            myPlace = allPlaces[0]
        }else {
            var temp = placeJS[myIndex - 1]
            let placeId = temp["placeId"].stringValue
            debugPrint(placeId)
            setPlaceStatus(sessionId: AuthService.instance.authToken, placeId: placeId, status: "1")
            myPlace = temp["name"].stringValue + " - online"
            UserDataService.instance.setPlaceId(placeId: placeId)
        }
        performSegue(withIdentifier: UNWIND, sender: self)
    }
    
    //set place status
    func setPlaceStatus(sessionId: String, placeId: String, status: String) {
        Alamofire.request("\(URL_SET_PLACES_STATUS)?sessionId=\(sessionId)&placeId=\(placeId)&status=\(status)", encoding: JSONEncoding.default ).responseJSON { response in
            if let value = response.result.value {
                let json = JSON(value)
                debugPrint(json)
            } else {
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    // pass data back to AccountVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let Des : AccountVC = segue.destination as! AccountVC
        Des.labelShowPlacesBtn = myPlace
    }

}
