//
//  ViewController.swift
//  StudioSolTestBooks
//
//  Created by Marcelo Diefenbach on 23/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        if let tabBarItems = self.tabBarController?.tabBar.items {
            tabBarItems[0].title = "Home"
            tabBarItems[1].title = "Adicionar"
            tabBarItems[2].title = "Buscar"
            tabBarItems[3].title = "Favoritos"
        }
    }
}

