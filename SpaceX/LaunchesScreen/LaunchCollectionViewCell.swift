//
//  LaunchCollectionViewCell.swift
//  SpaceX
//
//  Created by Julia on 13.08.2022.
//

import UIKit

class LaunchCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "LaunchCollectionViewCell"
    var viewModel: LaunchCollectionViewCellModelProtocol?
    var collectionView: UICollectionView?
    
    private lazy var redLine: UIView = {
        let line = UIView()
        line.backgroundColor = .sxRed
        return line
    }()
    
    private lazy var missionName: UILabel = {
        let missionName = UILabel()
        missionName.font = UIFont(name: "Inter-Bold", size: 16)
        missionName.numberOfLines = 0
        return missionName
    }()
    
    private lazy var launchDateLocal: UILabel = {
        let launchDateLocal = UILabel()
        return launchDateLocal
    }()
    
    private lazy var siteName: UILabel = {
        let siteName = UILabel()
        return siteName
    }()
    
    private lazy var rocketName: UILabel = {
        let rocketName = UILabel()
        rocketName.font = UIFont(name: "Inter-Regular", size: 10)
        return rocketName
    }()
    
    private lazy var rocketNameBackground: UIView = {
        let rocketNameBackground = UIView()
        rocketNameBackground.backgroundColor = .sxGray
        return rocketNameBackground
    }()
    
    private lazy var launchResult: UILabel = {
        let launchSuccess = UILabel()
        return launchSuccess
    }()
    
    private lazy var missionPatch: UIImageView = {
        let missionPatch = UIImageView()
        return missionPatch
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        return activityIndicator
    }()
    
    private func setUpContentView() {
        makeShadow()
        contentView.backgroundColor = .sxTabBarColor
        contentView.layer.cornerRadius = 10
        addSubviews()
        setUpConstraints()
        missionPatch.isHidden = true
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
   
    }
    
    private func addSubviews() {
        contentView.addSubview(redLine)
        contentView.addSubview(missionName)
        contentView.addSubview(launchDateLocal)
        contentView.addSubview(siteName)
        contentView.addSubview(rocketNameBackground)
        contentView.addSubview(launchResult)
        contentView.addSubview(missionPatch)
        contentView.addSubview(activityIndicator)
        rocketNameBackground.addSubview(rocketName)
    }
    
    private func setUpConstraints() {
        redLine.anchor(top: contentView.topAnchor,
                       leading: contentView.leadingAnchor,
                       bottom: nil,
                       trailing: nil,
                       spacing: .init(top: 15, left: 7, bottom: 0, right: 0),
                       size: .init(width: 6, height: .zero))
        redLine.heightAnchor.constraint(equalTo: missionName.heightAnchor).isActive = true
        
        missionName.anchor(top: redLine.topAnchor,
                           leading: redLine.trailingAnchor,
                           bottom: nil,
                           trailing: launchResult.leadingAnchor,
                           spacing: .init(top: .zero, left: 7, bottom: 0, right: 0))
        missionName.setContentHuggingPriority(UILayoutPriority(rawValue: 250), for: .horizontal)
        
        launchDateLocal.anchor(top: missionName.bottomAnchor,
                               leading: missionName.leadingAnchor,
                               bottom: nil,
                               trailing: nil,
                               spacing: .init(top: 10, left: 0, bottom: 0, right: 0))
        
        siteName.anchor(top: launchDateLocal.bottomAnchor,
                        leading: launchDateLocal.leadingAnchor,
                        bottom: nil,
                        trailing: nil,
                        spacing: .init(top: 2, left: 0, bottom: 0, right: 0))
        
        rocketNameBackground.anchor(top: siteName.bottomAnchor,
                                    leading: siteName.leadingAnchor,
                                    bottom: nil,
                                    trailing: nil,
                                    spacing: .init(top: 15, left: 0, bottom: 0, right: 0))
        
        rocketName.anchor(top: rocketNameBackground.topAnchor,
                          leading: rocketNameBackground.leadingAnchor,
                          bottom: rocketNameBackground.bottomAnchor,
                          trailing: rocketNameBackground.trailingAnchor,
                          spacing: .init(top: 2, left: 6, bottom: 2, right: 6))
        
        launchResult.anchor(top: contentView.topAnchor,
                            leading: nil,
                            bottom: nil,
                            trailing: contentView.trailingAnchor,
                            spacing: .init(top: 15, left: 5, bottom: 0, right: 20))
        
        missionPatch.anchor(top: launchResult.bottomAnchor,
                            leading: nil,
                            bottom: nil,
                            trailing: contentView.trailingAnchor,
                            spacing: .init(top: 10, left: 5, bottom: 0, right: 20),
                            size: CGSize(width: 60, height: 60))
        
        activityIndicator.anchor(top: launchResult.bottomAnchor,
                                 leading: nil,
                                 bottom: nil,
                                 trailing: contentView.trailingAnchor,
                                 spacing: .init(top: 10, left: 5, bottom: 0, right: 20),
                                 size: CGSize(width: 60, height: 60))
    }
    
    func configure() {
        setUpContentView()
        launchDateLocal.attributedText = viewModel?.launchDateLocal
        siteName.attributedText = viewModel?.siteName
        missionName.text = viewModel?.missionName
        rocketName.text = viewModel?.rocketName
        
        guard let result = self.viewModel?.data?.launchSuccess else { return }
        if result {
            launchResult.attributedText = viewModel?.launchSuccess
        } else {
            launchResult.attributedText = viewModel?.launchFailure
        }
        
        self.tag = viewModel?.indexPath.item ?? 0
        DispatchQueue.global().async {
            guard let url = URL(string: self.viewModel?.missionPatch ?? "") else { return }
            let data = try? Data(contentsOf: url)
            DispatchQueue.main.async {
                if self.tag == self.viewModel?.indexPath.item, let imageData = data {
                    self.missionPatch.image = UIImage(data: imageData)
                }
                self.activityIndicator.stopAnimating()
                self.missionPatch.isHidden = false
            }
        }
    }
    
    func makeShadow() {
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 4
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
    }
}
