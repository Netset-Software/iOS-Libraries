

import Foundation
import UIKit
import SystemConfiguration
import Alamofire
class WebServices: NSObject {
    
    class func headers() -> HTTPHeaders {
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        return headers
    }
    
    
    class  func getRequest(url: String, completionBlock: @escaping ( _ responseObject: Data) -> Void, onError: @escaping (_ error:String) -> Void ) {
        if InternetReachability.sharedInstance.isInternetAvailable() {
            debugPrint("url is ====================== \(url)")
            debugPrint("Header is =================== \(WebServices.headers())")
            debugPrint("=============================")
            AF.request(url, method: .get, encoding: JSONEncoding.default, headers: WebServices.headers()).responseJSON { ( response: DataResponse) in
                debugPrint("StatusCode is =============== \(response.response?.statusCode ?? 1100 )")
                debugPrint(response)
                switch response.result {
                case .success:
                    if let responseData = response.data {
                        do {
                            let statusCode = StatusCodes(rawValue: response.response?.statusCode ?? 100)
                            switch statusCode {
                            case .success:
                                completionBlock(responseData)
                            case .sessionExpire:
                            // do handling for session here
                            debugPrint("Session Expired")
                            default:
                                onError(response.error?.localizedDescription ?? Messages.internalServerError)
                            }
                        }
                    } else {
                        onError(response.error?.localizedDescription ?? Messages.internalServerError)
                    }
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                    onError(error.localizedDescription)
                }
            }
        } else {
            onError(Messages.noInternet)
          
        }
    }
    
    
    
    
}


