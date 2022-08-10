//
//  MainTabBarViewController.swift
//  SpaceX
//
//  Created by Julia on 11.07.2022.
//

import UIKit

private enum TabBarItems {
    
    case homeViewController
    case launchesViewController
    case rocketsViewController
    
    var title: String {
        switch self {
        case .homeViewController:
            return "Home"
        case .launchesViewController:
            return "Launches"
        case .rocketsViewController:
            return "Rockets"
        }
    }
    
    var iconName: String {
        switch self {
        case .homeViewController:
            return "house"
        case .launchesViewController:
            return "flame"
        case .rocketsViewController:
            return "rocket"
        }
    }
}

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTabBar()
    }
    
    private func setUpTabBar() {
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .sxTabBarColor
        let dataSource: [TabBarItems] = [.homeViewController, .launchesViewController, .rocketsViewController]
        self.viewControllers = dataSource.map {
            switch $0 {
            case .homeViewController:
                let homeViewController = HomeViewController()
                return self.wrappedInNavigationController(with: homeViewController, title: $0.title)
            case .launchesViewController:
                let launchesViewController = LaunchesViewController()
                return self.wrappedInNavigationController(with: launchesViewController, title: $0.title)
            case .rocketsViewController:
                let rocketsViewController = RocketsViewController()
                return self.wrappedInNavigationController(with: rocketsViewController, title: $0.title)
            }
        }
        self.viewControllers?.enumerated().forEach {
            $1.tabBarItem.title = dataSource[$0].title
            $1.tabBarItem.image = UIImage(named: dataSource[$0].iconName)
            $1.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: .zero, bottom: 3, right: .zero)
            $1.tabBarController?.tabBar.tintColor = .sxRed
            $1.tabBarController?.tabBar.unselectedItemTintColor = .sxItemColor
        }
        makeTabBarShadow()
    }
    
    private func wrappedInNavigationController(with: UIViewController, title: Any?) -> NavigationController {
        return NavigationController(rootViewController: with)
    }
    
    private func makeTabBarShadow() {
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 2
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.3
    }
}
