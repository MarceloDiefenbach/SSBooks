//
//  BooksTableViewCell.swift
//  StudioSol
//
//  Created by Marcelo Diefenbach on 22/10/22.
//

import UIKit

protocol BookDetailsDelegate: AnyObject {
    
    func showBookDetails(book: Book)
}

class BooksTableViewCell: UITableViewCell,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var viewModel = HomeViewModel()
    var delegate: BookDetailsDelegate!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        collectionView.layer.backgroundColor = UIColor.systemGray6.cgColor
        
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

        cell.book = self.viewModel.books[indexPath.row]
        cell.setCellLayoutAndData()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate.showBookDetails(book: self.viewModel.books[indexPath.row])
    }
    
}

