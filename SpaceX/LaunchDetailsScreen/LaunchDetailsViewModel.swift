//
//  LaunchDetailsViewModel.swift
//  SpaceX
//
//  Created by Julia on 22.08.2022.
//

import Foundation
import Apollo

protocol LaunchDetailsViewModelProtocol {
    var data: LaunchesQuery.Data.Launch? { get }
    var missionName: String { get }
    var launchDateLocal: NSMutableAttributedString { get }
    var siteName: NSMutableAttributedString { get }
    var launchSuccess: NSMutableAttributedString { get }
    var launchFailure: NSMutableAttributedString { get }
    var missionPatch: String { get }
    
    var rocketName: String { get }
    var rocketCountry: String { get }
    var rocketHeight: String { get }
    var rocketMass: String { get }
    var rocketDiameter: String { get }
    var rocketSuccessRate: String { get }
    var rocketDescription: String { get }
    
    var isSaved: Bool { get }
    
    func checkSavedStatus()
    func toggleSave()
}

class LaunchDetailsViewModel: LaunchDetailsViewModelProtocol {
    
    var isSaved: Bool
    
    init(data: LaunchesQuery.Data.Launch?) {
        self.data = data
        isSaved = false
    }
    
    var data: LaunchesQuery.Data.Launch?
    
    var missionName: String {
        data?.missionName ?? "No info"
    }
    
    var launchDateLocal: NSMutableAttributedString {
        let date = data?.launchDateLocal ?? ""
        return date.createAttributedString(launchCellAttributes: .calendar(imageSize: 25, fontSize: 14, imageOffset: -6))
    }
    
    var siteName: NSMutableAttributedString {
        let globe = data?.launchSite?.siteName ?? "No info"
        return globe.createAttributedString(launchCellAttributes: .globe(imageSize: 25, fontSize: 14, imageOffset: -6))
    }
    
    var rocketName: String {
        data?.rocket?.rocketName ?? "No info"
    }
    
    var launchSuccess: NSMutableAttributedString {
        let success = "Success "
        return success.createAttributedString(launchCellAttributes: .launchSuccess(imageSize: 28, fontSize: 12, imageOffset: -8))
    }
    
    var launchFailure: NSMutableAttributedString {
        let failure = "Failure "
        return failure.createAttributedString(launchCellAttributes: .launchFaillure(imageSize: 28, fontSize: 12, imageOffset: -8))
    }
    
    var missionPatch: String {
        data?.links?.missionPatch ?? ""
    }
    
    var rocketCountry: String {
        data?.rocket?.rocket?.country ?? "No info"
    }
    
    var rocketHeight: String {
        "\(data?.rocket?.rocket?.height?.meters ?? 0) meters"
    }
    
    var rocketMass: String {
        "\(data?.rocket?.rocket?.mass?.kg ?? 0) kg."
    }
    
    var rocketDiameter: String {
        "\(data?.rocket?.rocket?.diameter?.meters ?? 0) meters"
    }
    
    var rocketSuccessRate: String {
        "\(data?.rocket?.rocket?.successRatePct ?? 0) %"
    }
    
    var rocketDescription: String {
        "\(data?.rocket?.rocket?.description ?? "No info")"
    }
    
    private var dataManager = DataManager.shared
    
    func checkSavedStatus() {
        dataManager.checkSavedStatus(data: data) { result in
            isSaved = result
        }
    }
    
    func toggleSave() {
        if !isSaved {
            dataManager.saveLaunch(data: data) { result in
                isSaved = result
            }
        } else {
            dataManager.unsaveLaunch(data: data) { result in
                isSaved = result
            }
        }
    }
}
