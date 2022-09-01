//
//  SavedLaunchesViewController.swift
//  SpaceX
//
//  Created by Julia on 29.08.2022.
//

import UIKit

class SavedLaunchesViewController: UIViewController {
    
    let dataManager = DataManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Saved Launches"
        view.backgroundColor = .sxWhite
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
