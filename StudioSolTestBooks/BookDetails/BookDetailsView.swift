//
//  BookDetailsViewController.swift
//  StudioSolTestBooks
//
//  Created by Marcelo Diefenbach on 26/10/22.
//

import Foundation
import UIKit

class BookDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, BookDetailsViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var book: Book?
    
    @IBAction func swipeBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInsetAdjustmentBehavior = .never
        
        var frame = self.view.bounds
        frame.origin.y = -frame.size.height
        let primary = UIView(frame: frame)
        primary.tag = 3
        primary.backgroundColor = UIColor.black
        self.tableView.addSubview(primary)

        let widthConstraint = NSLayoutConstraint(item: primary, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1, constant: 0)
        let centerX = NSLayoutConstraint(item: primary, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)

        NSLayoutConstraint.deactivate(primary.constraints)
        NSLayoutConstraint.activate([
            widthConstraint, centerX
        ])
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "HeaderBookDetails") as! HeaderBookDetailsTableViewCell
            
            cell.book = self.book
            cell.setLayout()
            cell.delegate = self
            cell.selectionStyle = .none
            
            return cell
        } else {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "bookDetailsCell") as! BookDetailsTableViewCell
            
            cell.book = self.book
            cell.setData()
            cell.selectionStyle = .none
            
            return cell
        }
    }
    
    func back() {
        self.navigationController?.popViewController(animated: true)
    }
}
