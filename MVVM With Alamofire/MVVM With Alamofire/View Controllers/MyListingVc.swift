//
//  ViewController.swift
//  MVVM With Alamofire
//
//  Created by netset on 09/08/21.
//

import UIKit

class MyListingVc: UIViewController {
    
    @IBOutlet weak var listTblView: UITableView!
    @IBOutlet weak var activityLoader: UIActivityIndicatorView!
    var objVM = MyListingVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        activityLoader.startAnimating()
            self.objVM.fetchListing {
                self.listTblView.reloadData()
                self.activityLoader.stopAnimating()
                self.listTblView.separatorStyle = .singleLine
            } onError: {
                self.activityLoader.stopAnimating()
            }
        
    }
}
