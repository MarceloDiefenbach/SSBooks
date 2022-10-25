//
//  HomeView.swift
//  StudioSol
//
//  Created by Marcelo Diefenbach on 21/10/22.
//

import UIKit

class HomeView: UIViewController {
    
    enum SegmentedControlOptions{
        case myBooks
        case borrowed
    }
    
    var viewModel = HomeViewModel()
    
    var segmentedControl: SegmentedControlOptions = .myBooks
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var topBackground: UIView!
    
    @IBOutlet weak var myBooksSegmentedControl: UIView!
    @IBOutlet weak var segmentedControlFirst: UILabel!
    @IBOutlet weak var segmentedMarkFirst: UIView!
    
    
    @IBOutlet weak var borroweSegmentedControl: UIView!
    @IBOutlet weak var segmentedControlSecond: UILabel!
    @IBOutlet weak var segmentedMarkSecond: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topBackground.roundCorners(corners: [.bottomRight], radius: 32)
        topBackground.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        topBackground.layer.shadowOpacity = 0.1
        
        segmentedControlFirst.text = viewModel.segmentedControlFirst
        segmentedControlSecond.text = viewModel.segmentedControlSecond
        
        segmentedMarkFirst.layer.opacity = 1
        segmentedMarkSecond.layer.opacity = 0
        addActionOnMyBooksSegmentedControl()
        addActionOnBorrowedSegmentedControl()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.layer.backgroundColor = UIColor.systemGray6.cgColor
    }
    
    
    //MARK: - gestureRecognizer
    
    func addActionOnMyBooksSegmentedControl() {
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.changeToMyBooks))
        myBooksSegmentedControl.addGestureRecognizer(tapGR)
        myBooksSegmentedControl.isUserInteractionEnabled = true
        
    }
    
    @objc func changeToMyBooks(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            segmentedControl = .myBooks
            segmentedMarkFirst.layer.opacity = 1
            segmentedMarkSecond.layer.opacity = 0
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func addActionOnBorrowedSegmentedControl() {
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.changeToBorrowed))
        borroweSegmentedControl.addGestureRecognizer(tapGR)
        borroweSegmentedControl.isUserInteractionEnabled = true
    }
    
    @objc func changeToBorrowed(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            segmentedControl = .borrowed
            segmentedMarkFirst.layer.opacity = 0
            segmentedMarkSecond.layer.opacity = 1
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentedControl == .myBooks {
            return 4 + viewModel.allBooks.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "booksCell") as! BooksTableViewCell
            
            return cell
            
        } else if indexPath.row == 1 {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "AuthorsCell") as! AuthorsTableViewCell
            
            cell.authors = viewModel.authors
            return cell
            
        } else if indexPath.row == 2 {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "LibraryCell") as! LibraryTableViewCell
            
            return cell
            
        } else {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "LibraryCell") as! LibraryTableViewCell
            
            return cell
        }
    }
    
}

//MARK: - custom border radius
extension UIView {
    
    enum RoundCornersAt{
        case topRight
        case topLeft
        case bottomRight
        case bottomLeft
    }
    
    func roundCorners(corners:[RoundCornersAt], radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = [
            corners.contains(.topRight) ? .layerMaxXMinYCorner:.init(),
            corners.contains(.topLeft) ? .layerMinXMinYCorner:.init(),
            corners.contains(.bottomRight) ? .layerMaxXMaxYCorner:.init(),
            corners.contains(.bottomLeft) ? .layerMinXMaxYCorner:.init(),
        ]
    }
}
