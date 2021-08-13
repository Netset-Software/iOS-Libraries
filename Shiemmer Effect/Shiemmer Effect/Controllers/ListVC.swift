//
//  ListVC.swift
//  Shiemmer Effect
//
//  Created by netset on 11/08/21.
//

import UIKit

class ListVC: UIViewController {
    
    @IBOutlet weak var listView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didSelectStart(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
   sender.isSelected ? AMShimmer.start(for: self.listView) :   AMShimmer.stop(for: self.listView)
    }
    
}

extension ListVC : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellsIdentifers.ListCell)
     return cell ?? UITableViewCell()
    }
    
}


