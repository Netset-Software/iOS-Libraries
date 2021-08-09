//
//  MyListing Data Source + Delegate(S).swift
//  MVVM With Alamofire
//
//  Created by netset on 09/08/21.
//

import Foundation
import UIKit

extension MyListingVc: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objVM.listingArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTblView.dequeueReusableCell(withIdentifier: CellIdentifers.myListingCell) as? MyListingCell
        cell?.info = objVM.listingArray[indexPath.row]
        return cell ?? UITableViewCell()
    }
}
