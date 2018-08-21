//
//  PhotoTableViewCell.swift
//  Halanx
//
//  Created by Shubham Arora on 21/08/18.
//  Copyright © 2018 Shubham Arora. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerNib()
    }

    /// Register Cell Nib
    func registerNib() {
        
        let photoCollectionNib = UINib(nibName: CellNib.photoCollectionCell, bundle: Bundle.main)
        collectionView.register(photoCollectionNib, forCellWithReuseIdentifier: CellIdentifier.photoCollectionCell)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
