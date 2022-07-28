//
//  HistoryView.swift
//  SpaceX
//
//  Created by Julia on 20.07.2022.
//

import UIKit

class HistoryView: UIView {
    
    lazy var articleTitle: UILabel = {
        let articleTitle = UILabel()
        articleTitle.text = titleText
        articleTitle.numberOfLines = 0
        articleTitle.font = UIFont(name: "Inter-Regular", size: 20)
        return articleTitle
    }()
    
    lazy var articleLabel: UILabel = {
        let articleLabel = UILabel()
        articleLabel.text = articleText
        articleLabel.numberOfLines = 0
        articleLabel.font = UIFont(name: "Inter-Regular", size: 12)
        return articleLabel
    }()
    
    lazy var articleButton: UIButton = {
        let articleLink = UIButton()
        let yourAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Inter-Regular", size: 12) as Any,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        let attributeString = NSMutableAttributedString(
            string: "Read article in web...",
            attributes: yourAttributes
        )
        articleLink.setAttributedTitle(attributeString, for: .normal)
        return articleLink
    }()
    
    lazy var chevronImage: UIImageView = {
        let chevronImage = UIImageView(image: UIImage(named: "arrow")?.withTintColor(.sxItemColor))
        return chevronImage
    }()
    
    let titleText: String?
    let articleText: String?
    let link: String?
    let homeVC: HomeViewController
    
    init(titleText: String?, articleText: String?, link: String?, homeVC: HomeViewController) {
        self.titleText = titleText
        self.articleText = articleText
        self.link = link
        self.homeVC = homeVC
        super.init(frame: .zero)
        addSubviews()
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(articleTitle)
        addSubview(articleLabel)
        addSubview(articleButton)
        addSubview(chevronImage)
    }
    
    private func setUpView() {
        backgroundColor = .sxTabBarColor
        setUpConstraints()
        setUpArticleButton()
        openHistoryDetailsVC()
    }
    
    private func setUpConstraints() {
        heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        articleTitle.translatesAutoresizingMaskIntoConstraints = false
        articleTitle.topAnchor.constraint(equalTo: topAnchor).isActive = true
        articleTitle.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        articleTitle.trailingAnchor.constraint(lessThanOrEqualTo: chevronImage.leadingAnchor, constant: -10).isActive = true
        articleTitle.translatesAutoresizingMaskIntoConstraints = false
        articleTitle.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
        articleTitle.setContentHuggingPriority(UILayoutPriority(251), for: .vertical)
        
        articleLabel.translatesAutoresizingMaskIntoConstraints = false
        articleLabel.topAnchor.constraint(equalTo: articleTitle.bottomAnchor, constant: 8).isActive = true
        articleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        articleLabel.trailingAnchor.constraint(lessThanOrEqualTo: chevronImage.leadingAnchor, constant: -10).isActive = true
        articleLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
        articleLabel.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 749), for: .vertical)
        
        articleButton.translatesAutoresizingMaskIntoConstraints = false
        articleButton.trailingAnchor.constraint(lessThanOrEqualTo: chevronImage.trailingAnchor, constant: -10).isActive = true
        articleButton.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        articleButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
        articleButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        articleButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        articleButton.topAnchor.constraint(greaterThanOrEqualTo: articleLabel.bottomAnchor, constant: 8).isActive = true
        
        chevronImage.translatesAutoresizingMaskIntoConstraints = false
        chevronImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        chevronImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        chevronImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        chevronImage.widthAnchor.constraint(equalToConstant: 12).isActive = true
    }
    
    private func setUpArticleButton() {
        articleButton.addTarget(self, action: #selector(openArticle), for: .touchUpInside)
    }
    
    private func openHistoryDetailsVC() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(moveToHistoryDetailsVC))
        addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func moveToHistoryDetailsVC() {
        let historyDetailsVC = HistoryDetailViewController()
        homeVC.navigationController?.pushViewController(historyDetailsVC, animated: true)
    }
    
    @objc func openArticle() {
        UIApplication.shared.open(URL(string: link ?? "")!)
    }
}
