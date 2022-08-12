//
//  InfoView.swift
//  SpaceX
//
//  Created by Julia on 03.08.2022.
//

import UIKit

class InfoView: UIView {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 7
        return stackView
    }()
    
    private lazy var launchInfoLabel = UILabel()
    private lazy var launchYearLabel = UILabel()
    private lazy var launchSuccessLabel = UILabel()
    
    private let flight: ApIflight
    
    init(flight: ApIflight) {
        self.flight = flight
        super.init(frame: .zero)
        setUpView()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        addSubview(stackView)
        setUpLaunchInfo()
        setUpLaunchYear()
        setUpLaunchSuccess()
    }
    
    private func setUpLaunchInfo() {
        guard let details = flight.details else { return }
        stackView.addArrangedSubview(launchInfoLabel)
        
        launchInfoLabel.numberOfLines = 0
        launchInfoLabel.font = UIFont(name: "Inter-Regular", size: 12)
        launchInfoLabel.text = details
    }
    
    private func setUpLaunchYear() {
        guard let launchYear = flight.launchYear else { return }
        stackView.addArrangedSubview(launchYearLabel)
        
        let launchYearStringAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Inter-Regular", size: 12) as Any
        ]
        let yearAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Inter-Regular", size: 15) as Any,
            .foregroundColor: UIColor.sxRed
        ]
        let launchYearString = NSMutableAttributedString(string: "Launch year - ", attributes: launchYearStringAttributes)
        let year = NSAttributedString(string: launchYear, attributes: yearAttributes)
        launchYearString.append(year)
        launchYearLabel.attributedText = launchYearString
    }
    
    private func setUpLaunchSuccess() {
        guard let launchSuccess = flight.launchSuccess else { return }
        stackView.addArrangedSubview(launchSuccessLabel)
        
        let launchSuccessStringAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Inter-Regular", size: 12) as Any
        ]
        let resultAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Inter-Regular", size: 15) as Any,
            .foregroundColor: setResultColor()
        ]
        let launchSuccessString = NSMutableAttributedString(string: "Launch success - ", attributes: launchSuccessStringAttributes)
        let result = NSAttributedString(string: "\(launchSuccess)", attributes: resultAttributes)
        launchSuccessString.append(result)
        launchSuccessLabel.attributedText = launchSuccessString
    }
    
    private func setUpConstraints() {
        stackView.anchor(top: topAnchor,
                         leading: leadingAnchor,
                         bottom: bottomAnchor,
                         trailing: trailingAnchor,
                         spacing: .init(top: 15, left: 20, bottom: 15, right: 20))
    }
    
    private func setResultColor() -> UIColor {
        var color = UIColor.white
        
        if flight.launchSuccess == true {
            color = .sxGreen
        } else {
            color = .sxRed
        }
        return color
    }
}
