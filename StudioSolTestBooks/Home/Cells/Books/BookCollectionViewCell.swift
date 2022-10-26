//
//  BookCollectionViewCell.swift
//  StudioSol
//
//  Created by Marcelo Diefenbach on 22/10/22.
//

import UIKit

protocol LbraryDeletage: AnyObject {
    func callSegueFromCell()
}

class BookCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLable: UILabel!
    
    var book: Book?
    
    override func prepareForReuse() {
        book = nil
        coverImage.image = nil
        titleLabel.text = nil
        subtitleLable.text = nil
    }
    
    func setCellLayoutAndData() {
        coverImage.layer.cornerRadius = 8
        
        self.titleLabel.text = book?.name
        self.subtitleLable.text = book?.author?.name
        
        self.getImageFromAPI(urlString: book?.cover ?? "", completionHandler: {(image) in
            self.coverImage.image = image
        })
    }
    
    func getImageFromAPI (urlString: String, completionHandler: @escaping (UIImage) -> Void) {
        guard let url = URL(string: urlString) else {return}
        
        DispatchQueue.global(qos: .background).async {
            guard let image = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                completionHandler(UIImage(data: image)!)
            }
        }
    }
}
