//
//  LibraryTableViewCell.swift
//  StudioSolTestBooks
//
//  Created by Marcelo Diefenbach on 25/10/22.
//

import UIKit

class LibraryTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var categories: [String] = ["Todos", "Romance", "Aventura", "Comédia"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
        collectionView.delegate = self

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "category", for: indexPath) as! LibraryCollectionViewCell
        
        cell.label.text = categories[indexPath.row]
        
        if indexPath.row != 0 {
            cell.setDisabledTags()
        }
        cell.setLayout()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }

}

extension LibraryTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.categories[indexPath.row].size(withAttributes: nil)
    }
}
