//
//  BookCollectionViewCell.swift
//  StudioSol
//
//  Created by Marcelo Diefenbach on 22/10/22.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLable: UILabel!
    
    override class func awakeFromNib() {
        
    }
    
    override func prepareForReuse() {
        coverImage.image = nil
        titleLabel.text = nil
        subtitleLable.text = nil
    }
    
    func setCorner() {
        coverImage.layer.cornerRadius = 8
    }
}
