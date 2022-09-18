//
//  HistoryCardView.swift
//  SpaceX
//
//  Created by Julia on 04.08.2022.
//

import UIKit

class HistoryCardView: UIView {
    
    private let history: HomeInfoQuery.Data.History
    
    weak var presenter: UINavigationController?
    
    init(history: HomeInfoQuery.Data.History) {
        self.history = history
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        let historyView = BackroundCardView()
        let historyViewElements = HistoryView(titleText: history.title,
                                              articleText: history.details,
                                              link: history.links?.article)
        
        addSubview(historyView)
        historyView.anchor(top: topAnchor,
                           leading: leadingAnchor,
                           bottom: bottomAnchor,
                           trailing: trailingAnchor)
        
        historyView.addSubview(historyViewElements)
        
        historyViewElements.anchor(top: historyView.topAnchor,
                                   leading: historyView.leadingAnchor,
                                   bottom: historyView.bottomAnchor,
                                   trailing: historyView.trailingAnchor,
                                   spacing: .init(top: 20, left: 20, bottom: 20, right: 0))
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(moveToHistoryDetailsVC))
        addGestureRecognizer(tap)
    }
    
    @objc func moveToHistoryDetailsVC() {
        let viewModel = HistoryDetailsViewModel(data: history)
        let historyDetailsVC = HistoryDetailViewController(viewModel: viewModel)
        presenter?.pushViewController(historyDetailsVC, animated: true)
    }
}
