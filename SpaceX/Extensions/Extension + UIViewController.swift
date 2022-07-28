//
//  Extension + UIViewController.swift
//  SpaceX
//
//  Created by Julia on 26.07.2022.
//

import UIKit

extension UIViewController {
    func startAnimationLoaderView() -> ActivityIndicator {
        let rocketsView = ActivityIndicator(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        view.addSubview(rocketsView)
        rocketsView.accessibilityIdentifier = "indicatorView"
        NSLayoutConstraint.activate([
            rocketsView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            rocketsView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            rocketsView.heightAnchor.constraint(equalToConstant: 50),
            rocketsView.widthAnchor.constraint(equalToConstant: 100)
        ])
        rocketsView.startAnimation()
        return rocketsView
    }
}
