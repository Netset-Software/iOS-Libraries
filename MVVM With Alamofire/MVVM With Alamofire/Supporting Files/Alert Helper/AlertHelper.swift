//
//  AlertHelper.swift
//  FarmApp
//
//  Created by Aman on 28/08/20.
//  Copyright © 2020 Netset. All rights reserved.
//

import Foundation
import UIKit


class Alert: NSObject {
    
    class  func showAlert(message: String) {
        let alert = UIAlertController(title: AppInfo.appName, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            alert.dismiss(animated: true, completion: nil)
        }))
        UIApplication.getTopViewController()?.present(alert, animated: true, completion: nil)
    }
    
    
    
}


