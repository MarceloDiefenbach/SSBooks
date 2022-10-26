//
//  BookHorizontalTableViewCell.swift
//  StudioSolTestBooks
//
//  Created by Marcelo Diefenbach on 25/10/22.
//

import UIKit

class BookHorizontalTableViewCell: UITableViewCell {
    @IBOutlet weak var cover: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cover.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        cover.image = nil
        title.text = nil
        subtitle.text = nil
    }
    
}
