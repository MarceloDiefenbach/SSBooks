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
    
    override func prepareForReuse() {
        label.text = nil
    }
    
    func setLayout() {
        self.background.layer.cornerRadius = background.bounds.height/2
    }
    
    func setDisabledTags() {
        self.background.layer.backgroundColor = UIColor(named: "white")?.cgColor
        self.background.layer.borderWidth = 1
        self.background.layer.borderColor = UIColor.systemGray.cgColor
        self.label.textColor = UIColor(named: "gray")
    }
    
}
