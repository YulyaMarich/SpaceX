//
//  BackroundCardView.swift
//  SpaceX
//
//  Created by Julia on 22.07.2022.
//

import UIKit

class BackroundCardView: UIView {
    
    private lazy var redLine: UIView = {
        let line = UIView()
        line.backgroundColor = .sxRed
        return line
    }()
    
    private var redLineIsHidden: Bool
    
    init(redLineIsHidden: Bool = false) {
        self.redLineIsHidden = redLineIsHidden
        super.init(frame: .zero)
        addSubview(redLine)
        setUpView()
        makeTabBarShadow()
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
        redLine.isHidden = redLineIsHidden
        redLine.anchor(top: topAnchor,
                       leading: leadingAnchor,
                       bottom: nil,
                       trailing: nil,
                       spacing: .init(top: 23, left: 7, bottom: 0, right: 0),
                       size: .init(width: 6, height: 40))
    }
    
    private func makeTabBarShadow() {
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 4
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
    }
}

