//
//  SavedLaunchesViewController.swift
//  SpaceX
//
//  Created by Julia on 29.08.2022.
//

import UIKit
import Apollo

class SavedLaunchesViewController: UIViewController {
    
    @Published private(set) var savedItems: [LaunchesQuery.Data.Launch] = []
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = .init(top: 20, left: .zero, bottom: 20, right: .zero)
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        return collectionView
    }()
    
    private lazy var infoNotFound: UILabel = {
        let infoNotFound = UILabel()
        return infoNotFound
    }()
    
    private lazy var refreshControll: UIRefreshControl = {
        let refreshControll = UIRefreshControl()
        return refreshControll
    }()
    
    private var dataManager = DataManager.shared
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        dataManager.getSavedLaunches { savedItems in
            self.savedItems = savedItems
        }
        
        if !savedItems.isEmpty {
            setUpCollectionView()
            collectionView.reloadData()
        } else {
            collectionView.removeFromSuperview()
            showInfoNotFound()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpVIew()
        
        refreshControll.addTarget(self, action: #selector(refreshCollectionView), for: .valueChanged)
        collectionView.refreshControl = refreshControll
    }
    
    @objc func refreshCollectionView() {
        collectionView.reloadData()
        refreshControll.endRefreshing()
    }
    
    private func setUpVIew() {
        navigationItem.title = "Saved Launches"
        navigationController?.navigationBar.tintColor = .sxRed
        view.backgroundColor = .sxWhite
        view.addSubview(collectionView)
    }
    
    private func showInfoNotFound() {
        let infoNotFound = UILabel()
        view.addSubview(infoNotFound)
        infoNotFound.text = "No saved launches😔"
        infoNotFound.font = UIFont(name: "Inter-Regular", size: 15)
        
        infoNotFound.translatesAutoresizingMaskIntoConstraints = false
        infoNotFound.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        infoNotFound.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
    
    private func setUpCollectionView() {
        collectionView.register(LaunchCollectionViewCell.self,
                                forCellWithReuseIdentifier: LaunchCollectionViewCell.identifier)
        
        collectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                              leading: view.safeAreaLayoutGuide.leadingAnchor,
                              bottom: view.safeAreaLayoutGuide.bottomAnchor,
                              trailing: view.safeAreaLayoutGuide.trailingAnchor)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension SavedLaunchesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return savedItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LaunchCollectionViewCell.identifier,
                                                      for: indexPath) as! LaunchCollectionViewCell
        cell.viewModel = LaunchCollectionViewCellModel(data: savedItems[indexPath.item], indexPath: indexPath)
        cell.configure()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.safeAreaLayoutGuide.layoutFrame.width - 40, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewModel = LaunchDetailsViewModel(data: savedItems[indexPath.item])
        let launchDetailsVC = LaunchDetailsViewController(viewModel: viewModel)
        let navigationVC = UINavigationController(rootViewController: launchDetailsVC)
        navigationVC.modalPresentationStyle = .fullScreen
        self.present(navigationVC, animated: true)
    }
}
