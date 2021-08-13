//
//  App Structure.swift
//  MVVM With Alamofire
//
//  Created by netset on 09/08/21.
//

import Foundation
import UIKit

enum StatusCodes: Int {
    case success = 200 // success
    case unprocessableEntry = 422  // unprocessable entity
    case unknownError = 500   // Unknown error in the server
    case sessionExpire = 401 // session expired
}


