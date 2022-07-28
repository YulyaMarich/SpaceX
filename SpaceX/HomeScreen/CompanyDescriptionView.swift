//
//  CompanyDescriptionView.swift
//  SpaceX
//
//  Created by Julia on 21.07.2022.
//

import UIKit

class CompanyDescriptionView: UIView {
    
    lazy var companyActivityLabel: UILabel = {
        let companyActivityLabel = UILabel()
        companyActivityLabel.numberOfLines = 0
        companyActivityLabel.text = companyActivityText
        companyActivityLabel.font = UIFont(name: "Inter-Regular", size: 12)
        companyActivityLabel.lineBreakMode = .byWordWrapping
        return companyActivityLabel
    }()
    
    lazy var founderLabel: UILabel = {
        let founderLabel = UILabel()
        founderLabel.numberOfLines = 0
        founderLabel.text = "Founder: \(founderText ?? "No info")"
        founderLabel.font = UIFont(name: "Inter-Regular", size: 12)
        return founderLabel
    }()
    
    lazy var yearLabel: UILabel = {
        let yearLabel = UILabel()
        yearLabel.numberOfLines = 0
        yearLabel.text = "Year: \(yearText ?? 0)"
        yearLabel.font = UIFont(name: "Inter-Regular", size: 12)
        return yearLabel
    }()
    
    lazy var valuationLabel: UILabel = {
        let valuationLabel = UILabel()
        valuationLabel.numberOfLines = 0
        valuationLabel.text = "Valuation: \(valuationText ?? 0)$"
        valuationLabel.font = UIFont(name: "Inter-Regular", size: 12)
        return valuationLabel
    }()
    
    lazy var twitterButton: UIButton = {
        let twitterButton = UIButton()
        twitterButton.titleLabel?.font = UIFont(name: "Inter-Regular", size: 12)
        twitterButton.setTitle("Twitter", for: .normal)
        twitterButton.setTitleColor(.sxTwittterColor, for: .normal)
        
        let image = UIImage(named: "twitter")
        let newImage = image!.resizedImage(Size: .init(width: 20, height: 20))
        twitterButton.setImage(newImage,for: .normal)
        return twitterButton
    }()
    
    var companyActivityText: String?
    var founderText: String?
    var yearText: Int?
    var valuationText: Double?
    
    init(companyActivityText: String?, founderText: String?, yearText: Int?, valuationText: Double?) {
        self.companyActivityText = companyActivityText
        self.founderText = founderText
        self.yearText = yearText
        self.valuationText = valuationText
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        addSubviews()
        setUpConstraints()
        tapTwitterButton()
    }
    
    private func addSubviews() {
        addSubview(companyActivityLabel)
        addSubview(founderLabel)
        addSubview(yearLabel)
        addSubview(valuationLabel)
        addSubview(twitterButton)
    }
    
    private func setUpConstraints() {
        companyActivityLabel.anchor(top: topAnchor,
                                    leading: leadingAnchor,
                                    bottom: founderLabel.topAnchor,
                                    trailing: trailingAnchor,
                                    padding: .init(top: 0, left: 0, bottom: 7, right: 0))
        
        founderLabel.anchor(top: nil,
                            leading: leadingAnchor,
                            bottom: yearLabel.topAnchor,
                            trailing: trailingAnchor,
                            padding: .init(top: 0, left: 0, bottom: 3, right: 0))
        
        yearLabel.anchor(top: nil,
                         leading: leadingAnchor,
                         bottom: valuationLabel.topAnchor,
                         trailing: trailingAnchor,
                         padding: .init(top: 0, left: 0, bottom: 3, right: 0))
        
        valuationLabel.anchor(top: nil,
                              leading: leadingAnchor,
                              bottom: twitterButton.topAnchor,
                              trailing: trailingAnchor,
                              padding: .init(top: 0, left: 0, bottom: 3, right: 0))
        
        twitterButton.anchor(top: nil,
                             leading: nil,
                             bottom: bottomAnchor,
                             trailing: trailingAnchor,
                             padding: .init(top: 0, left: 0, bottom: 0, right: 0))
    }
    
    private func tapTwitterButton() {
        twitterButton.addTarget(self, action: #selector(twitterTapped), for: .touchUpInside)
    }
    
    @objc func twitterTapped() {
        UIApplication.shared.open(URL(string: "https://twitter.com/spacex")!)
    }
    
}
