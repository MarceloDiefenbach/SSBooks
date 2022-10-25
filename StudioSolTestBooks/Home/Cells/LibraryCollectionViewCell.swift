//
//  LibraryCollectionViewCell.swift
//  StudioSolTestBooks
//
//  Created by Marcelo Diefenbach on 25/10/22.
//

import UIKit

class LibraryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var background: UIView!
    
    override class func awakeFromNib() {
        
    }
    
    func setLayout() {
        self.background.layer.cornerRadius = 8
    }
    
    func setDisabledTags() {
        self.background.layer.backgroundColor = UIColor.white.cgColor
        self.background.layer.borderWidth = 1
        self.background.layer.borderColor = UIColor.systemGray2.cgColor
        self.label.textColor = UIColor.systemGray
    }
    
}
