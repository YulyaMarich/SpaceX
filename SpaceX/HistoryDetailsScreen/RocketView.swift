//
//  RocketView.swift
//  SpaceX
//
//  Created by Julia on 03.08.2022.
//

import UIKit

class RocketView: UIView {
    
    private lazy var rocketNameView: BackroundCardView = {
        let rocketName = BackroundCardView(redLineIsHidden: true)
        return rocketName
    }()
    
    private lazy var rocketCountryView: BackroundCardView = {
        let rocketCountry = BackroundCardView(redLineIsHidden: true)
        return rocketCountry
    }()
    
    private lazy var rocketDescriptionView: BackroundCardView = {
        let rocketDescription = BackroundCardView(redLineIsHidden: true)
        return rocketDescription
    }()
    
    private let flight: ApIflight.Rocket.Rocket?
    
    init(flight: ApIflight.Rocket.Rocket?) {
        self.flight = flight
        super.init(frame: .zero)
        addSubviews()
        setUpRocketNameView()
        setUpRocketCountryView()
        setUpRocketDescriptionView()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(rocketNameView)
        addSubview(rocketCountryView)
        addSubview(rocketDescriptionView)
    }
    
    private func setUpConstraints() {
        rocketNameView.anchor(top: topAnchor,
                              leading: leadingAnchor,
                              bottom: nil,
                              trailing: trailingAnchor)
        
        rocketCountryView.anchor(top: rocketNameView.bottomAnchor,
                                 leading: leadingAnchor,
                                 bottom: nil,
                                 trailing: trailingAnchor,
                                 spacing: .init(top: 15, left: 0, bottom: 0, right: 0))
        
        rocketDescriptionView.anchor(top: rocketCountryView.bottomAnchor,
                                     leading: leadingAnchor,
                                     bottom: bottomAnchor,
                                     trailing: trailingAnchor,
                                     spacing: .init(top: 15, left: 0, bottom: 0, right: 0))
    }
    
    private func setUpRocketNameView() {
        let rocketName = UILabel()
        rocketName.textAlignment = .center
        rocketName.numberOfLines = 0
        rocketNameView.addSubview(rocketName)
        
        let rocketImage = NSTextAttachment()
        rocketImage.image = UIImage(named:"rocket")?.withTintColor(.sxItemColor)
        let imageOffsetY: CGFloat = -5
        rocketImage.bounds = CGRect(x: 0, y: imageOffsetY, width: 21, height: 21)
        
        let rocketStringAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Inter-Regular", size: 15) as Any
        ]
        let rocketString = NSAttributedString(
            string: "   Rocket - ",
            attributes: rocketStringAttributes
        )
        
        let rocketNameAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Inter-Regular", size: 18) as Any,
            .foregroundColor: UIColor.sxRed
        ]
        
        let rocketNameString = NSAttributedString(
            string: flight?.name ?? "No info",
            attributes: rocketNameAttributes)
        
        let rocketText = NSMutableAttributedString(attachment: rocketImage)
        rocketText.append(rocketString)
        rocketText.append(rocketNameString)
        rocketName.attributedText = rocketText
        
        rocketName.anchor(top: rocketNameView.topAnchor,
                          leading: rocketNameView.leadingAnchor,
                          bottom: rocketNameView.bottomAnchor,
                          trailing: rocketNameView.trailingAnchor,
                          spacing: .init(top: 10, left: 0, bottom: 10, right: 0))
    }
    
    private func setUpRocketCountryView() {
        let rocketCountry = UILabel()
        rocketCountry.text = "Country - \(flight?.country ?? "No info")"
        rocketCountry.font = UIFont(name: "Inter-Regular", size: 15)
        rocketCountry.textAlignment = .center
        rocketCountryView.addSubview(rocketCountry)
        
        rocketCountry.anchor(top: rocketCountryView.topAnchor,
                             leading: rocketCountryView.leadingAnchor,
                             bottom: rocketCountryView.bottomAnchor,
                             trailing: rocketCountryView.trailingAnchor,
                             spacing: .init(top: 10, left: 0, bottom: 10, right: 0))
    }
    
    private func setUpRocketDescriptionView() {
        let rocketDescription = UILabel()
        rocketDescription.text = flight?.description ?? "No info"
        rocketDescription.font = UIFont(name: "Inter-Regular", size: 15)
        rocketDescription.numberOfLines = 0
        rocketDescriptionView.addSubview(rocketDescription)
        
        rocketDescription.anchor(top: rocketDescriptionView.topAnchor,
                                 leading: rocketDescriptionView.leadingAnchor,
                                 bottom: rocketDescriptionView.bottomAnchor,
                                 trailing: rocketDescriptionView.trailingAnchor,
                                 spacing: .init(top: 15, left: 20, bottom: 15, right: 20))
    }
}
