//
//  LaunchesViewController.swift
//  SpaceX
//
//  Created by Julia on 11.07.2022.
//

import UIKit

class LaunchesViewController: UIViewController {
    
    private let viewModel: LaunchesViewModelProtocol
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = .init(top: 20, left: .zero, bottom: 20, right: .zero)
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        createSavedLaunchesButton()
        let loader = startAnimationLoaderView()
        viewModel.fetch { [weak self] in
            guard let strongSelf = self else { return }
            loader.removeFromSuperview()
            strongSelf.setUpCollectionView()
        }
    }
    
    init(viewModel: LaunchesViewModelProtocol = LaunchesViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        view.backgroundColor = .sxWhite
        navigationItem.title = "Launches"
    }
    
    private func createSavedLaunchesButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart.fill"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(openSavedLaunchesVC))
        navigationItem.rightBarButtonItem?.tintColor = .sxRed
    }
    
    @objc func openSavedLaunchesVC() {
        let savedLaunchesScreen = SavedLaunchesViewController()
        navigationController?.pushViewController(savedLaunchesScreen, animated: true)
    }
    
    private func setUpCollectionView() {
        collectionView.register(LaunchCollectionViewCell.self,
                                forCellWithReuseIdentifier: LaunchCollectionViewCell.identifier)
        
        view.addSubview(collectionView)
        collectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                              leading: view.safeAreaLayoutGuide.leadingAnchor,
                              bottom: view.safeAreaLayoutGuide.bottomAnchor,
                              trailing: view.safeAreaLayoutGuide.trailingAnchor)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension LaunchesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.data?.launches?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LaunchCollectionViewCell.identifier,
                                                      for: indexPath) as! LaunchCollectionViewCell
        let launch = viewModel.data?.launches?[indexPath.item]
        cell.viewModel = LaunchCollectionViewCellModel(data: launch, indexPath: indexPath)
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
        let viewModel = LaunchDetailsViewModel(data: viewModel.data?.launches?[indexPath.item])
        let launchDetailsVC = LaunchDetailsViewController(viewModel: viewModel)
        let navigationVC = UINavigationController(rootViewController: launchDetailsVC)
        navigationVC.modalPresentationStyle = .fullScreen
        self.present(navigationVC, animated: true)
    }
}
