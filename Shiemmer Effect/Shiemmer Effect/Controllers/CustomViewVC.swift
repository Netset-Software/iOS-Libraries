//
//  CustomViewVC.swift
//  Shiemmer Effect
//
//  Created by netset on 11/08/21.
//

import UIKit

class CustomViewVC: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var btnAction: UIButton!
    @IBOutlet weak var redView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.imgView.layer.cornerRadius = self.imgView.frame.width / 2
        }
       
        
        
    }
    
    @IBAction func didTappedStart(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
         sender.isSelected ? AMShimmer.start(for: self.view) :AMShimmer.stop(for: self.view)
    }
    
    
}
