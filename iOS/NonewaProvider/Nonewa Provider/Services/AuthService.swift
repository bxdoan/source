//
//  AuthService.swift
//  Nonewa Provider
//
//  Created by Doan on 12/16/17.
//  Copyright © 2017 Nonewa. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import SwiftyJSON

class AuthService {
    
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    
    var isLoggedIn : Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY )
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken : String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userName: String {
        get {
            return defaults.value(forKey: USER_NAME_KEY) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_NAME_KEY)
        }
    }
    
    var avatarLink: String {
        get {
            return defaults.value(forKey: AVATAR_LINK_KEY) as! String
        }
        set {
            defaults.set(newValue, forKey: AVATAR_LINK_KEY)
        }
    }
    
    func loginUser(userName: String, password: String, completion: @escaping CompletionHandler) {
        
        Alamofire.request("\(URL_LOGIN)?username=\(userName)&password=\(password)", encoding: JSONEncoding.default ).responseJSON { response in
            
            if let value = response.result.value {
            let json = JSON(value)
            self.userName = json["name"].stringValue
            self.avatarLink = json["imageLink"].stringValue
            self.authToken = json["sessionId"].stringValue
            debugPrint(json["sessionId"].stringValue)
            self.isLoggedIn = true
            completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func findUserBySessionId(completion: @escaping CompletionHandler) {
        Alamofire.request("\(URL_INFO)?SessionId=\(authToken)", encoding: JSONEncoding.default).responseJSON { (response) in
            if let value = response.result.value {
                let json = JSON(value)
                let info = json["info"]
                debugPrint(info)
                self.setUserInfo(info: info)
                completion(true)
                
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    
    
    
    func setUserInfo(info: JSON) {
        let name = info["name"].stringValue
        let description = info["description"].stringValue
        let imageLink = info["imageLink"].stringValue

        UserDataService.instance.setUserData(imageLink: imageLink, description: description, name: name)
    }
    
}
