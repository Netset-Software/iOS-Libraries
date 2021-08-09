//
//  MyListingVM.swift
//  MVVM With Alamofire
//
//  Created by netset on 09/08/21.
//

import Foundation
import UIKit


class MyListingVM: NSObject {
    
    var listingArray = [Docs]()
    
    func fetchListing(onSuccess:@escaping() -> Void, onError: @escaping() -> Void) {
        WebServices.getRequest(url: WebApis.getMyList) { (data) in
            do {
                let data = try JSONDecoder().decode(MyListingModel.self, from: data)
                self.listingArray = data.response?.docs ?? []
                onSuccess()
            } catch {
                Alert.showAlert(message: error.localizedDescription)
                onError()
            }
        } onError: { (error) in
            Alert.showAlert(message: error)
            onError()
        }
        
    }
    
}
