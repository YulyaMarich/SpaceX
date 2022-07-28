//
//  BackroundCardView.swift
//  SpaceX
//
//  Created by Julia on 22.07.2022.
//

import UIKit

class BackroundCardView: UIView {
    
    lazy var redLine: UIView = {
        let line = UIView()
        line.backgroundColor = .sxRed
        return line
    }()
    
    init() {
        super.init(frame: .zero)
        addSubview(redLine)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        backgroundColor = .sxTabBarColor
        layer.cornerRadius = 10
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        redLine.anchor(top: topAnchor,
                       leading: leadingAnchor,
                       bottom: nil,
                       trailing: nil,
                       padding: .init(top: 24, left: 7, bottom: 0, right: 7),
                       size: .init(width: 6, height: 40))
    }
}

