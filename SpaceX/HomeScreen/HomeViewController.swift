//
//  HomeViewController.swift
//  SpaceX
//
//  Created by Julia on 11.07.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private var companyDescriptionView = BackroundCardView()
    
    private var historyLabel: UILabel = {
        let label = UILabel()
        label.text = "Histories"
        label.font = UIFont(name: "Inter-Regular", size: 15)
        return label
    }()
    
    private var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 18
        return stack
    }()
    
    var viewModel = HomeViewModel()
    
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
    
    private func setUpVC() {
        navigationItem.title = "SpaceX"
        view.backgroundColor = .sxWhite
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(companyDescriptionView)
        scrollView.addSubview(historyLabel)
        scrollView.addSubview(stackView)
        addConstraints()
        setUpHistoriesStackView()
        setUpCompanyDescriptionView()
    }
    
    private func addConstraints() {
        scrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                          leading: view.safeAreaLayoutGuide.leadingAnchor,
                          bottom: view.safeAreaLayoutGuide.bottomAnchor,
                          trailing: view.safeAreaLayoutGuide.trailingAnchor)
        
        companyDescriptionView.anchor(top: scrollView.contentLayoutGuide.topAnchor,
                                      leading: scrollView.contentLayoutGuide.leadingAnchor,
                                      bottom: historyLabel.topAnchor,
                                      trailing: scrollView.contentLayoutGuide.trailingAnchor,
                                      padding: .init(top: 10, left: 20, bottom: 18, right: 20))
        
        companyDescriptionView.anchor(top: nil,
                                      leading: scrollView.frameLayoutGuide.leadingAnchor,
                                      bottom: nil,
                                      trailing: scrollView.frameLayoutGuide.trailingAnchor,
                                      padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        
        historyLabel.anchor(top: nil,
                            leading: scrollView.contentLayoutGuide.leadingAnchor,
                            bottom: stackView.topAnchor,
                            trailing: scrollView.contentLayoutGuide.trailingAnchor,
                            padding: .init(top: 0, left: 20, bottom: 3, right: 20))
        
        stackView.anchor(top: nil,
                         leading: scrollView.contentLayoutGuide.leadingAnchor,
                         bottom: scrollView.contentLayoutGuide.bottomAnchor,
                         trailing: scrollView.contentLayoutGuide.trailingAnchor,
                         padding: .init(top: 0, left: 20, bottom: 20, right: 20))
    }
    
    func setUpCompanyDescriptionView() {
        guard let company = viewModel.data?.company else { return }
        
        let companyDescriptionViewElements = CompanyDescriptionView(companyActivityText: company.summary,
                                                                    founderText: company.founder,
                                                                    yearText: company.founded,
                                                                    valuationText: company.valuation)
        
        companyDescriptionView.addSubview(companyDescriptionViewElements)
        
        companyDescriptionViewElements.anchor(top: companyDescriptionView.topAnchor,
                                              leading: companyDescriptionView.leadingAnchor,
                                              bottom: companyDescriptionView.bottomAnchor,
                                              trailing: companyDescriptionView.trailingAnchor,
                                              padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    func setUpHistoriesStackView() {
        guard let histories = viewModel.data?.histories else { return }
        
        for history in histories {
            let historyView = BackroundCardView()
            let historyViewElements = HistoryView(titleText: history?.title,
                                                  articleText: history?.details,
                                                  link: history?.links?.article,
                                                  homeVC: self)
            
            stackView.addArrangedSubview(historyView)
            historyView.addSubview(historyViewElements)
            
            historyViewElements.anchor(top: historyView.topAnchor,
                                       leading: historyView.leadingAnchor,
                                       bottom: historyView.bottomAnchor,
                                       trailing: historyView.trailingAnchor,
                                       padding: .init(top: 20, left: 20, bottom: 20, right: 0))
        }
    }
}

