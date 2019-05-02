//
//  UserDataService.swift
//  Nonewa Provider
//
//  Created by Doan on 12/20/17.
//  Copyright © 2017 Nonewa. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON


class UserDataService {
    
    static let instance = UserDataService()
    
    public private(set) var imageLink = ""
    public private(set) var description = ""
    public private(set) var name = ""
    public private(set) var placeId = ""
    
    
    func setUserData(imageLink: String, description: String, name: String) {
        self.description = description
        self.name = name
        self.imageLink = imageLink

    }
    
    func setPlaceId(placeId: String) {
        self.placeId = placeId
    }
    
    
    func returnUIColor(components: String) -> UIColor {
        let scanner = Scanner(string: components)
        let skipped = CharacterSet(charactersIn: "[], ")
        let comma = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skipped
        
        var r, g, b, a : NSString?
        
        scanner.scanUpToCharacters(from: comma, into: &r)
        scanner.scanUpToCharacters(from: comma, into: &g)
        scanner.scanUpToCharacters(from: comma, into: &b)
        scanner.scanUpToCharacters(from: comma, into: &a)
        
        let defaultColor = UIColor.lightGray
        
        guard let rUnwrapped = r else { return defaultColor }
        guard let gUnwrapped = g else { return defaultColor }
        guard let bUnwrapped = b else { return defaultColor }
        guard let aUnwrapped = a else { return defaultColor }
        
        let rfloat = CGFloat(rUnwrapped.doubleValue)
        let gfloat = CGFloat(gUnwrapped.doubleValue)
        let bfloat = CGFloat(bUnwrapped.doubleValue)
        let afloat = CGFloat(aUnwrapped.doubleValue)
        
        let newUIColor = UIColor(red: rfloat, green: gfloat, blue: bfloat, alpha: afloat)
        
        return newUIColor
    }
    
    func logoutUser() {
        imageLink = ""
        name = ""
        description = ""
        placeId = ""
        AuthService.instance.isLoggedIn = false
        AuthService.instance.userName = ""
        AuthService.instance.avatarLink = ""
        Alamofire.request("\(URL_LOGOUT)?SessionId=\(AuthService.instance.authToken)", encoding: JSONEncoding.default).responseJSON { (response) in
                if  response.result.value != nil {
                    debugPrint("Logout success")
                } else {
                    debugPrint(response.result.error as Any)
            }
        }
        AuthService.instance.authToken = ""
        
    }
}
