//
//  BooksTableViewCell.swift
//  StudioSol
//
//  Created by Marcelo Diefenbach on 22/10/22.
//

import UIKit

class BooksTableViewCell: UITableViewCell,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var viewModel = HomeViewModel()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.layer.backgroundColor = UIColor.systemGray6.cgColor
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        self.viewModel.getFavoriteBooks(completionHandler: { (response) in
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })

    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.books.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookCollectionCell", for: indexPath) as! BookCollectionViewCell
        cell.titleLabel.text = self.viewModel.books[indexPath.row].name
        cell.subtitleLable.text = self.viewModel.books[indexPath.row].author?.name
        
        getImageFromAPI(urlString: self.viewModel.books[indexPath.row].cover ?? "", completionHandler: {(image) in
            cell.coverImage.image = image
        })
        
        cell.setCorner()
        
        return cell
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

