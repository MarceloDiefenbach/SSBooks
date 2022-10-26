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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
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
