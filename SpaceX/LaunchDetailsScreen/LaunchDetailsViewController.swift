//
//  LaunchDetailsViewController.swift
//  SpaceX
//
//  Created by Julia on 22.08.2022.
//

import UIKit

class LaunchDetailsViewController: UIViewController {
    
    var viewModel: LaunchDetailsViewModelProtocol
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private lazy var scrollViewContainer: UIView = {
        let scrollViewContainer = UIView()
        return scrollViewContainer
    }()
    
    private lazy var generalInfoView: UIView = {
        let generalInfoView = UIView()
        generalInfoView.backgroundColor = .sxWhite
        generalInfoView.layer.cornerRadius = 10
        generalInfoView.layer.shadowOffset = CGSize(width: 0, height: 0)
        generalInfoView.layer.shadowRadius = 4
        generalInfoView.layer.shadowColor = UIColor.black.cgColor
        generalInfoView.layer.shadowOpacity = 0.3
        return generalInfoView
    }()
    
    private lazy var missionName: UILabel = {
        let missionName = UILabel()
        missionName.font = UIFont(name: "Inter-Bold", size: 30)
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
    
    private lazy var launchResultBackground: UIView = {
        let launchResultBackground = UIView()
        launchResultBackground.backgroundColor = .sxGray
        return launchResultBackground
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
    
    private lazy var rocketLabel: UILabel = {
        let rocketLabel = UILabel()
        rocketLabel.text = "Rocket"
        rocketLabel.font = UIFont(name: "Inter-Bold", size: 15)
        return rocketLabel
    }()
    
    private lazy var rocketDescriptionBackground: UIView = {
        let rocketDescriptionBackground = UIView()
        rocketDescriptionBackground.backgroundColor = .sxTabBarColor
        return rocketDescriptionBackground
    }()
    
    private lazy var rocketDescriptionStack: UIStackView = {
        let rocketDescriptionStack = UIStackView()
        return rocketDescriptionStack
    }()
    
    private lazy var rocketDescription: UILabel = {
        let rocketDescription = UILabel()
        rocketDescription.numberOfLines = 0
        rocketDescription.font = UIFont(name: "Inter-Regular", size: 15)
        return rocketDescription
    }()
    
    private lazy var rocketImage: UIImageView = {
        let rocketImage = UIImageView(image: UIImage(named: "rocket")?.withTintColor(.sxBlack))
        return rocketImage
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    init(viewModel: LaunchDetailsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addCancelButton() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"),
                                                                style: .plain,
                                                                target: self,
                                                                action: #selector(dismissView))
    }
    
    @objc func dismissView() {
        dismiss(animated: true)
    }
    
    private func setUpView() {
        view.backgroundColor = .sxTabBarColor
        navigationController?.navigationBar.prefersLargeTitles = false
        addSubviews()
        setUpConstraints()
        addCancelButton()
        setUpStack()
        setUpValues()
        missionPatch.isHidden = true
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
    private func addSubviews() {
        view.addSubview(generalInfoView)
        view.addSubview(rocketDescriptionBackground)
        view.addSubview(activityIndicator)
        
        generalInfoView.addSubview(missionName)
        generalInfoView.addSubview(launchDateLocal)
        generalInfoView.addSubview(siteName)
        generalInfoView.addSubview(missionPatch)
        generalInfoView.addSubview(launchResultBackground)
        
        launchResultBackground.addSubview(launchResult)
        
        rocketDescriptionBackground.addSubview(scrollView)
        rocketDescriptionBackground.addSubview(rocketLabel)
        rocketDescriptionBackground.addSubview(rocketImage)
        
        
        scrollView.addSubview(scrollViewContainer)
        
        scrollViewContainer.addSubview(rocketDescriptionStack)
        scrollViewContainer.addSubview(rocketDescription)
    }
    
    private func setUpConstraints() {
        generalInfoView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                               leading: view.safeAreaLayoutGuide.leadingAnchor,
                               bottom: rocketDescriptionBackground.topAnchor,
                               trailing: view.safeAreaLayoutGuide.trailingAnchor,
                               spacing: .init(top: 5, left: 5, bottom: 10, right: 5))
        
        missionName.anchor(top: generalInfoView.topAnchor,
                           leading: generalInfoView.leadingAnchor,
                           bottom: nil,
                           trailing: nil,
                           spacing: .init(top: 20, left: 18, bottom: 0, right: 0))
        missionName.trailingAnchor.constraint(lessThanOrEqualTo: generalInfoView.trailingAnchor).isActive = true
        
        launchDateLocal.anchor(top: missionName.bottomAnchor,
                               leading: generalInfoView.leadingAnchor,
                               bottom: nil,
                               trailing: nil,
                               spacing: .init(top: 20, left: 15, bottom: 0, right: 0))
        
        siteName.anchor(top: launchDateLocal.bottomAnchor,
                        leading: generalInfoView.leadingAnchor,
                        bottom: nil,
                        trailing: nil,
                        spacing: .init(top: 5, left: 15, bottom: 0, right: 0))
        
        launchResultBackground.anchor(top: siteName.bottomAnchor,
                                      leading: generalInfoView.leadingAnchor,
                                      bottom: generalInfoView.bottomAnchor,
                                      trailing: nil,
                                      spacing: .init(top: 20, left: 15, bottom: 20, right: 0))
        
        launchResult.anchor(top: launchResultBackground.topAnchor,
                            leading: launchResultBackground.leadingAnchor,
                            bottom: launchResultBackground.bottomAnchor,
                            trailing: launchResultBackground.trailingAnchor,
                            spacing: .init(top: 3, left: 20, bottom: 3, right: 20))
        
        missionPatch.anchor(top: nil,
                            leading: nil,
                            bottom: launchResultBackground.bottomAnchor,
                            trailing: generalInfoView.trailingAnchor,
                            spacing: .init(top: 18, left: 0, bottom: 0, right: 15),
                            size: CGSize(width: 120, height: 120))
        
        activityIndicator.anchor(top: missionName.bottomAnchor,
                                 leading: nil,
                                 bottom: nil,
                                 trailing: generalInfoView.trailingAnchor,
                                 spacing: .init(top: 18, left: 0, bottom: 0, right: 15),
                                 size: CGSize(width: 130, height: 130))
        
        rocketDescriptionBackground.anchor(top: nil,
                                           leading: view.safeAreaLayoutGuide.leadingAnchor,
                                           bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                           trailing: view.safeAreaLayoutGuide.trailingAnchor,
                                           spacing: .init(top: 0, left: 0, bottom: 15, right: 0))
        
        rocketLabel.anchor(top: rocketDescriptionBackground.topAnchor,
                           leading: rocketDescriptionBackground.leadingAnchor,
                           bottom: scrollView.topAnchor,
                           trailing: rocketDescriptionBackground.trailingAnchor,
                           spacing: .init(top: 15, left: 20, bottom: 15, right: 20))
        
        scrollView.anchor(top: nil,
                          leading: rocketDescriptionBackground.leadingAnchor,
                          bottom: rocketImage.topAnchor,
                          trailing: rocketDescriptionBackground.trailingAnchor,
                          spacing: .init(top: 0, left: 0, bottom: 15, right: 0))
        
        scrollViewContainer.anchor(top: scrollView.topAnchor,
                                   leading: scrollView.leadingAnchor,
                                   bottom: scrollView.bottomAnchor,
                                   trailing: scrollView.trailingAnchor)
        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        rocketDescriptionStack.anchor(top: scrollViewContainer.topAnchor,
                                      leading: scrollViewContainer.leadingAnchor,
                                      bottom: nil,
                                      trailing: scrollViewContainer.trailingAnchor,
                                      spacing: .init(top: 0, left: 20, bottom: 20, right: 20))
        
        rocketDescription.anchor(top: rocketDescriptionStack.bottomAnchor,
                                 leading: scrollViewContainer.leadingAnchor,
                                 bottom: scrollViewContainer.bottomAnchor,
                                 trailing: scrollViewContainer.trailingAnchor,
                                 spacing: .init(top: 15, left: 20, bottom: 0, right: 20))
        
        rocketImage.translatesAutoresizingMaskIntoConstraints = false
        rocketImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        rocketImage.bottomAnchor.constraint(equalTo: rocketDescriptionBackground.bottomAnchor).isActive = true
        rocketImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        rocketImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func setUpValues() {
        missionName.text = viewModel.missionName
        launchDateLocal.attributedText = viewModel.launchDateLocal
        siteName.attributedText = viewModel.siteName
        rocketDescription.text = viewModel.rocketDescription
        
        guard let result = self.viewModel.data?.launchSuccess else { return }
        if result {
            launchResult.attributedText = viewModel.launchSuccess
        } else {
            launchResult.attributedText = viewModel.launchFailure
        }
        
        DispatchQueue.global().async {
            guard let url = URL(string: self.viewModel.missionPatch) else { return }
            let data = try? Data(contentsOf: url)
            DispatchQueue.main.async {
                if let imageData = data {
                    self.missionPatch.image = UIImage(data: imageData)
                }
                self.activityIndicator.stopAnimating()
                self.missionPatch.isHidden = false
            }
        }
    }
    
    private func setUpStack() {
        rocketDescriptionStack.axis = .vertical
        rocketDescriptionStack.spacing = 15
        
        let rocketName = createStack(with: "Name", and: "\(viewModel.rocketName)")
        let rocketCountry = createStack(with: "Country", and: "\(viewModel.rocketCountry)")
        let rocketHeight = createStack(with: "Height", and: "\(viewModel.rocketHeight)")
        let rocketMass = createStack(with: "Mass", and: "\(viewModel.rocketMass)")
        let rocketDiameter = createStack(with: "Diameter", and: "\(viewModel.rocketDiameter)")
        let rocketSuccessRate = createStack(with: "Success rate", and: "\(viewModel.rocketSuccessRate)")
        
        rocketDescriptionStack.addArrangedSubview(rocketName)
        rocketDescriptionStack.addArrangedSubview(rocketCountry)
        rocketDescriptionStack.addArrangedSubview(rocketHeight)
        rocketDescriptionStack.addArrangedSubview(rocketMass)
        rocketDescriptionStack.addArrangedSubview(rocketDiameter)
        rocketDescriptionStack.addArrangedSubview(rocketSuccessRate)
    }
    
    private func createStack(with variavble: String, and result: String) -> UIStackView {
        let stackView = UIStackView()
        let variableLabel = UILabel()
        let resultLabel = UILabel()
        stackView.addArrangedSubview(variableLabel)
        stackView.addArrangedSubview(resultLabel)
        
        variableLabel.text = variavble
        variableLabel.font = UIFont(name: "Inter-Regular", size: 12)
        resultLabel.text = result
        resultLabel.font = UIFont(name: "Inter-Regular", size: 15)
        
        stackView.spacing = 15
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        return stackView
    }
}
