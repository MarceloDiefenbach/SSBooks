//
//  AuthorCollectionViewCell.swift
//  StudioSolTestBooks
//
//  Created by Marcelo Diefenbach on 25/10/22.
//

import UIKit

class AuthorCollectionViewCell: UICollectionViewCell {
    
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
        background.layer.cornerRadius = 8
        background.layer.borderColor = UIColor.systemGray2.cgColor
        background.layer.borderWidth = 1
        coverImage.layer.cornerRadius = 8
    }
    
}
