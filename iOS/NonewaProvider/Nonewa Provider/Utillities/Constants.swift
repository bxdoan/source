//
//  Constants.swift
//  Nonewa Provider
//
//  Created by Doan on 12/16/17.
//  Copyright © 2017 Nonewa. All rights reserved.
//

import Foundation
import UIKit

typealias CompletionHandler = (_ Success: Bool) -> ()

// URL constants
let BASE_URL = "https://nonewa.com"
let URL_LOGIN = "\(BASE_URL)/api/provider/login"
let URL_LOGOUT = "\(BASE_URL)/api/provider/logout"
let URL_INFO = "\(BASE_URL)/api/provider/getinfo"
let URL_GET_PLACES_STATUS = "\(BASE_URL)/api/provider/getplacesstatus"
let URL_SET_PLACES_STATUS = "\(BASE_URL)/api/provider/setplacesstatus"
let URL_GET_ORDER_UNCOMPLETE = "\(BASE_URL)/api/provider/getorderuncomplete"
let URL_SET_ORDER_STATUS = "\(BASE_URL)/api/provider/setorder"
let URL_GET_NOTIFIES = "\(BASE_URL)/api/provider/getnotifies"

// Segues
let TO_LOGIN = "toLogin"
let UNWIND = "unwindToAccount"
let UNWINDORDER = "unwindToOrder"
let TO_PLACES = "toPlaces"
let TO_SHOW_DETAIL_ORDER = "showDetailOrder"
let TO_ORDER_STATUS = "toOrderStatus"

// Colors
let nonewaPurplePlaceholder = #colorLiteral(red: 0.3254901961, green: 0.4215201139, blue: 0.7752227187, alpha: 0.5)


// Notification Constants
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")

// Provider Default
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_NAME_KEY = "userNameKey"
let AVATAR_LINK_KEY = "avatarLinkKey"

// Header
let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
    ]

let BEARER_HEADER = [
    "Authorization":"Bearer \(AuthService.instance.authToken)",
    "Content-Type": "application/json; charset=utf-8"
]

let ORDER_STATUS_LIST = ["Huỷ",
                         "Đã đặt hàng",
                         "Đang giao hàng",
                         "Đã giao hàng"]
let PAYMENT_STYLE_LIST = ["Trực tiếp",
                          "Qua NoNeWa"]
