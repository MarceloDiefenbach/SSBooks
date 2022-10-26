//
//  HeaderBookDetailsTableViewCell.swift
//  StudioSolTestBooks
//
//  Created by Marcelo Diefenbach on 26/10/22.
//

import UIKit

protocol BookDetailsViewDelegate: AnyObject {
    func back()
}

class HeaderBookDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var backgroundCircular: UIView!
    @IBOutlet weak var optionsButton: UIButton!
    
    var delegate: BookDetailsViewDelegate!
    var book: Book?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundCircular.roundCorners(corners: [.topLeft], radius: 20)
        self.optionsButton.transform = self.optionsButton.transform.rotated(by: CGFloat(90))
        
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
            self.delegate.back()
    }
    
    func setLayout() {
        
        getImageFromAPI(urlString: book?.cover ?? "", completionHandler: {(response) in
            self.coverImage.image = response
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
