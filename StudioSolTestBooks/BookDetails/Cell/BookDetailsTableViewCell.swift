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
    @IBOutlet weak var likeButton: UIButton!
    
    var likeButtonControl: Bool = true
    var book: Book?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func likeButtonAction(_ sender: Any) {
        likeButtonControl.toggle()
        if likeButtonControl {
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            //MARK: - logic to add to favorites on server
        } else {
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            //MARK: - logic to remove of favorites on server
        }

    }
    
    func setData() {
        title.text = book?.name
        subtitle.text = book?.author?.name
        synopsis.text = book?.description
    }

}
