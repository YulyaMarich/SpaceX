//
//  HistoryDetailViewController.swift
//  SpaceX
//
//  Created by Julia on 23.07.2022.
//

import UIKit
import YoutubePlayer

class HistoryDetailViewController: UIViewController {
    
    private var data: HomeInfoQuery.Data.History?
    private var flight: ApIflight?
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private lazy var scrollViewContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var missionNameLabel: UILabel = {
        let missionName = UILabel()
        return missionName
    }()
    
    private lazy var infoLabel: UILabel = {
        let infoLabel = UILabel()
        infoLabel.numberOfLines = 0
        infoLabel.font = UIFont(name: "Inter-Regular", size: 15)
        infoLabel.text = "Info about flight"
        return infoLabel
    }()
    
    private lazy var infoView: BackroundCardView = {
        let infoView = BackroundCardView(redLineIsHidden: true)
        return infoView
    }()
    
    private lazy var videoView: YoutubePlayerView = {
        let videoView = YoutubePlayerView()
        return videoView
    }()
    
    private lazy var videoLabel: UILabel = {
        let videoLabel = UILabel()
        videoLabel.font = UIFont(name: "Inter-Regular", size: 15)
        videoLabel.text = "Video"
        return videoLabel
    }()
    
    private lazy var infoNotFound: UILabel = {
        let infoNotFound = UILabel()
        return infoNotFound
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpVC()
        if data?.flight == nil {
            showInfoNotFound()
        } else {
            addSubviews()
            setUoMissionNameLabel()
            setUpConstraints()
            setUpInfoView()
            createRocketView()
            setUpVideoView()
        }
    }
    
    init(data: HomeInfoQuery.Data.History?) {
        self.data = data
        self.flight = data?.flight?.fragments.apIflight
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpVC() {
        view.backgroundColor = .sxWhite
        navigationItem.title = data?.title
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        UILabel.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).adjustsFontSizeToFitWidth = true
        navigationController?.navigationBar.tintColor = .sxRed
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.addSubview(missionNameLabel)
        scrollViewContainer.addSubview(infoLabel)
        scrollViewContainer.addSubview(infoView)
        scrollViewContainer.addSubview(videoLabel)
        scrollViewContainer.addSubview(videoView)
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
        
        missionNameLabel.anchor(top: scrollViewContainer.topAnchor,
                                leading: scrollViewContainer.leadingAnchor,
                                bottom: nil,
                                trailing: scrollViewContainer.trailingAnchor,
                                spacing: .init(top: 0, left: 20, bottom: 0, right: 20))
        
        infoLabel.anchor(top: missionNameLabel.bottomAnchor,
                         leading: scrollViewContainer.leadingAnchor,
                         bottom: nil,
                         trailing: scrollViewContainer.trailingAnchor,
                         spacing: .init(top: 10, left: 20, bottom: 0, right: 20))
        
        infoView.anchor(top: infoLabel.bottomAnchor,
                        leading: scrollViewContainer.leadingAnchor,
                        bottom: nil,
                        trailing: scrollViewContainer.trailingAnchor,
                        spacing: .init(top: 3, left: 20, bottom: 0, right: 20))
        
        videoLabel.anchor(top: infoView.bottomAnchor,
                          leading: scrollViewContainer.leadingAnchor,
                          bottom: nil,
                          trailing: scrollViewContainer.trailingAnchor,
                          spacing: UIEdgeInsets(top: 15, left: 20, bottom: 0, right: 20))
        
        videoView.anchor(top: videoLabel.bottomAnchor,
                         leading: scrollViewContainer.leadingAnchor,
                         bottom: nil,
                         trailing: scrollViewContainer.trailingAnchor,
                         spacing: .init(top: 3, left: 20, bottom: 0, right: 20),
                         size: CGSize(width: 0, height: 250))
    }
    
    private func setUoMissionNameLabel() {
        missionNameLabel.numberOfLines = 0
        let missionNameAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Inter-Regular", size: 15) as Any
        ]
        let nameAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Inter-Regular", size: 18) as Any,
            .foregroundColor: UIColor.sxRed
        ]
        
        let missionNameString = NSMutableAttributedString(string: "Mission name ", attributes: missionNameAttributes)
        
        let name = NSAttributedString(string: flight?.missionName ?? "", attributes: nameAttributes)
        
        missionNameString.append(name)
        missionNameLabel.attributedText = missionNameString
    }
    
    private func setUpInfoView() {
        guard let flight = flight else { return }
        let infoViewElements = InfoView(flight: flight)
        infoView.addSubview(infoViewElements)
        infoViewElements.anchor(top: infoView.topAnchor,
                                leading: infoView.leadingAnchor,
                                bottom: infoView.bottomAnchor,
                                trailing: infoView.trailingAnchor)
    }
    
    private func setUpVideoView() {
        videoView.layer.masksToBounds = true
        videoView.layer.cornerRadius = 10
        
        guard let url = URL(string: data?.flight?.fragments.apIflight.links?.videoLink ?? "") else { return }
        do {
            try self.videoView.loadVideo(withUrl: url, playerVars: .init(playsInline: .true))
        } catch {
            print(error)
        }
    }
    
    
    private func createRocketView() {
        let rocketView = RocketView(flight: flight?.rocket?.rocket)
        scrollView.addSubview(rocketView)
        rocketView.anchor(top: videoView.bottomAnchor,
                          leading: scrollView.contentLayoutGuide.leadingAnchor,
                          bottom: scrollView.contentLayoutGuide.bottomAnchor,
                          trailing: scrollView.contentLayoutGuide.trailingAnchor,
                          spacing: .init(top: 15, left: 20, bottom: 15, right: 20))
    }
    
    private func showInfoNotFound() {
        let infoNotFound = UILabel()
        view.addSubview(infoNotFound)
        infoNotFound.text = "Sorry, info not found😔"
        infoNotFound.font = UIFont(name: "Inter-Regular", size: 15)
        
        infoNotFound.translatesAutoresizingMaskIntoConstraints = false
        infoNotFound.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        infoNotFound.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
}
