//
//  MyListingCell.swift
//  MVVM With Alamofire
//
//  Created by netset on 09/08/21.
//

import Foundation
import UIKit




class MyListingCell: UITableViewCell {
    
    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblJournal: UILabel!
    @IBOutlet weak var lblEissn: UILabel!
    
    
    var info: Docs? {
        didSet {
            lblID.text = info?.id ?? ""
            lblJournal.text = info?.journal ?? ""
            lblEissn.text = info?.eissn ?? ""
        }
        
        
    }
    
    
    
}
