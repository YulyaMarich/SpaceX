//
//  HomeViewController.swift
//  SpaceX
//
//  Created by Julia on 11.07.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private lazy var scrollViewContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var companyDescriptionView = BackroundCardView()
    
    private lazy var historyLabel: UILabel = {
        let label = UILabel()
        label.text = "Histories"
        label.font = UIFont(name: "Inter-Regular", size: 15)
        return label
    }()
    
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 18
        return stack
    }()
    
    private let viewModel: HomeViewModelProtocol
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpVC()
        let loader = startAnimationLoaderView()
        
        viewModel.fetch { [weak self] in
            guard let strongSelf = self else { return }
            loader.removeFromSuperview()
            strongSelf.addSubviews()
        }
    }
    
    init(viewModel: HomeViewModelProtocol = HomeViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpVC() {
        navigationItem.title = "SpaceX"
        view.backgroundColor = .sxWhite
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.sxRed]
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationItem.largeTitleDisplayMode = .always
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.addSubview(companyDescriptionView)
        scrollViewContainer.addSubview(historyLabel)
        scrollViewContainer.addSubview(stackView)
        setUpConstraints()
        setUpHistoriesStackView()
        setUpCompanyDescriptionView()
    }
    
    private func setUpConstraints() {
        scrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                          leading: view.safeAreaLayoutGuide.leadingAnchor,
                          bottom: view.safeAreaLayoutGuide.bottomAnchor,
                          trailing: view.safeAreaLayoutGuide.trailingAnchor)
        
        scrollViewContainer.anchor(top: scrollView.topAnchor,
                                   leading: scrollView.leadingAnchor,
                                   bottom: scrollView.bottomAnchor,
                                   trailing: scrollView.trailingAnchor)
        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        companyDescriptionView.anchor(top: scrollViewContainer.topAnchor,
                                      leading: scrollViewContainer.leadingAnchor,
                                      bottom: historyLabel.topAnchor,
                                      trailing: scrollViewContainer.trailingAnchor,
                                      spacing: .init(top: 10, left: 20, bottom: 18, right: 20))
        
        historyLabel.anchor(top: nil,
                            leading: scrollViewContainer.leadingAnchor,
                            bottom: stackView.topAnchor,
                            trailing: scrollViewContainer.trailingAnchor,
                            spacing: .init(top: 0, left: 20, bottom: 3, right: 20))
        
        stackView.anchor(top: nil,
                         leading: scrollViewContainer.leadingAnchor,
                         bottom: scrollViewContainer.bottomAnchor,
                         trailing: scrollViewContainer.trailingAnchor,
                         spacing: .init(top: 0, left: 20, bottom: 20, right: 20))
    }
    
    private func setUpCompanyDescriptionView() {
        guard let company = viewModel.data?.company else { return }
        
        let companyDescriptionViewElements = CompanyDescriptionView(companyActivityText: company.summary,
                                                                    founderText: company.founder,
                                                                    yearText: company.founded,
                                                                    valuationText: company.valuation,
                                                                    twitterLink: company.links?.twitter)
        
        companyDescriptionView.addSubview(companyDescriptionViewElements)
        
        companyDescriptionViewElements.anchor(top: companyDescriptionView.topAnchor,
                                              leading: companyDescriptionView.leadingAnchor,
                                              bottom: companyDescriptionView.bottomAnchor,
                                              trailing: companyDescriptionView.trailingAnchor,
                                              spacing: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    private func setUpHistoriesStackView() {
        guard let histories = viewModel.data?.histories else { return }
        
        for history in histories {
            let historyCard = HistoryCardView(history: history)
            historyCard.presenter = navigationController
            stackView.addArrangedSubview(historyCard)
        }
    }
}

