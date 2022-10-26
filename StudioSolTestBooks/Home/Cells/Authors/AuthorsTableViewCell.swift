//
//  AuthorsTableViewCell.swift
//  StudioSolTestBooks
//
//  Created by Marcelo Diefenbach on 25/10/22.
//

import UIKit

class AuthorsTableViewCell: UITableViewCell,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var background: UIView!
    var viewModel = HomeViewModel()
    var authors: [Author]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.viewModel.getFavoriteAuthors(completionHandler: { (response) in
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
        
        setLayout()
        
    }
    
    func setLayout() {
        collectionView.layer.backgroundColor = UIColor.white.cgColor
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        background.roundCorners(corners: [.topLeft], radius: 32)
    }
    
    //MARK: - collectionView
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.authors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AuthorCollectionCell", for: indexPath) as! AuthorCollectionViewCell
        
        let author = self.viewModel.authors
        
        cell.titleLabel.text = author[indexPath.row].name
        cell.subtitleLable.text = "\(author[indexPath.row].booksCount ?? 0) livros"
        getImageFromAPI(urlString: author[indexPath.row].picture ?? "", completionHandler: {(image) in
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

