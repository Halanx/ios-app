//
//  MarketTableViewCell.swift
//  Halanx
//
//  Created by Shubham Arora on 17/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit

class MarketTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerNib()
    }

    /// Register Cell Nib
    func registerNib() {
        
        let marketCollectionNib = UINib(nibName: CellNib.marketCollectionCell, bundle: Bundle.main)
        collectionView.register(marketCollectionNib, forCellWithReuseIdentifier: CellIdentifier.marketCollectionCell)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
