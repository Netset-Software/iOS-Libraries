//
//  ChooseShiemmerType.swift
//  Shiemmer Effect
//
//  Created by netset on 11/08/21.
//

import UIKit

class ChooseShiemmerType: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    var shiemmerList = [ ShimmerTypes(title: "Table View"),ShimmerTypes(title: "Collection View"),ShimmerTypes(title: "Custom View")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.tableFooterView = UIView()   // remove seprator
    }
    
    
}


extension ChooseShiemmerType : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shiemmerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: CellsIdentifers.ShiemmerCell)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: CellsIdentifers.ShiemmerCell)
            cell?.textLabel?.text = shiemmerList[indexPath.row].title
        }
        return cell ?? UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            let targetVC = self.storyboard?.instantiateViewController(identifier: ViewControllersIdentifer.ListVC) as? ListVC
            self.navigationController?.pushViewController(targetVC ?? UIViewController(), animated: true)
            
        case 1:
            let targetVC = self.storyboard?.instantiateViewController(identifier: ViewControllersIdentifer.CollectionVC) as? CollectionVC
            self.navigationController?.pushViewController(targetVC ?? UIViewController(), animated: true)
            
            
        case 2:
            let targetVC = self.storyboard?.instantiateViewController(identifier: ViewControllersIdentifer.CustomViewVC) as? CustomViewVC
            self.navigationController?.pushViewController(targetVC ?? UIViewController(), animated: true)
            
        default:
            debugPrint("Default")
        }
        
    }
    
    
    
    
}
