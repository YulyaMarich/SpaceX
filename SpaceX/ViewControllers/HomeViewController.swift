//
//  HomeViewController.swift
//  SpaceX
//
//  Created by Julia on 11.07.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpVC()
    }
    
    private func setUpVC() {
        navigationItem.title = "SpaceX"
        view.backgroundColor = .sxWhite
    }
}
