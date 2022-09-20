//
//  RocketsViewController.swift
//  SpaceX
//
//  Created by Julia on 12.09.2022.
//

import UIKit
import SwiftUI

class RocketsViewController: UIViewController {
    
    private let viewModel: RocketsViewModelProtocol
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpVC()
        let loader = startAnimationLoaderView()
        viewModel.fetch { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.navigationController?.navigationBar.isHidden = true
            loader.removeFromSuperview()
            strongSelf.addRocketsView()
        }
    }
    
    init(viewModel: RocketsViewModelProtocol = RocketsViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpVC() {
        navigationItem.title = "Rockets"
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.sxRed]
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        view.backgroundColor = .sxWhite
    }
    
    private func addRocketsView() {
        guard let rockets = viewModel.data?.rockets else { return }
        let rocketsView = UIHostingController(rootView: RocketsView(passedRockets: rockets))
        addChild(rocketsView)
        rocketsView.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(rocketsView.view)
        rocketsView.didMove(toParent: self)
        rocketsView.view.anchor(top: view.topAnchor,
                                leading: view.leadingAnchor,
                                bottom: view.bottomAnchor,
                                trailing: view.trailingAnchor)
    }
}
