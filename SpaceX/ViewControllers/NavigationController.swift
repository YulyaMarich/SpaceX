//
//  NavigationController.swift
//  SpaceX
//
//  Created by Julia on 11.07.2022.
//

import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationController()
    }
    
    private func setUpNavigationController() {
        navigationBar.prefersLargeTitles = true
        UINavigationBar.appearance().tintColor = .sxRed
    }
}
