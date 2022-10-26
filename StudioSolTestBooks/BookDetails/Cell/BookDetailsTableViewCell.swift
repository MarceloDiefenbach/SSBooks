//
//  BookDetailsTableViewCell.swift
//  StudioSolTestBooks
//
//  Created by Marcelo Diefenbach on 26/10/22.
//

import UIKit

class BookDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var synopsis: UILabel!
    
    var book: Book?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setData() {
        title.text = book?.name
        subtitle.text = book?.author?.name
        synopsis.text = book?.description
    }

}
