//
//  CollectionVC.swift
//  Shiemmer Effect
//
//  Created by netset on 11/08/21.
//

import UIKit

class CollectionVC: UIViewController {

    @IBOutlet weak var gridView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTappedStart(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
      sender.isSelected ? AMShimmer.start(for: gridView) :   AMShimmer.stop(for: gridView)
    }
}


extension CollectionVC : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellsIdentifers.Cell, for: indexPath)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width / 2 - 15, height: 127)
    }
    
}

