//
//  LaunchCollectionViewCellModel.swift
//  SpaceX
//
//  Created by Julia on 14.08.2022.
//

import Foundation

protocol LaunchCollectionViewCellModelProtocol {
    var data: LaunchesQuery.Data.Launch? { get }
    var missionName: String { get }
    var launchDateLocal: NSMutableAttributedString { get }
    var siteName: NSMutableAttributedString { get }
    var rocketName: String { get }
    var launchSuccess: NSMutableAttributedString { get }
    var launchFailure: NSMutableAttributedString { get }
    var missionPatch: String { get }
    var indexPath: IndexPath { get }
}

class LaunchCollectionViewCellModel: LaunchCollectionViewCellModelProtocol {
    
    var indexPath: IndexPath
    
    var data: LaunchesQuery.Data.Launch?
    
    var missionName: String {
        data?.missionName ?? "No info"
    }
    
    var launchDateLocal: NSMutableAttributedString {
        let date = data?.launchDateLocal ?? ""
        return date.createAttributedString(launchCellAttributes: .calendar(imageSize: 15, fontSize: 12, imageOffset: -2.5))
    }
    
    var siteName: NSMutableAttributedString {
        let globe = data?.launchSite?.siteName ?? "No info"
        return globe.createAttributedString(launchCellAttributes: .globe(imageSize: 15, fontSize: 12, imageOffset: -2.5))
    }
    
    var rocketName: String {
        data?.rocket?.rocketName ?? "No info"
    }
    
    var launchSuccess: NSMutableAttributedString {
        let success = "Success "
        return success.createAttributedString(launchCellAttributes: .launchSuccess(imageSize: 22, fontSize: 12, imageOffset: -6))
    }
    
    var launchFailure: NSMutableAttributedString {
        let failure = "Failure "
        return failure.createAttributedString(launchCellAttributes: .launchFaillure(imageSize: 22, fontSize: 12, imageOffset: -6))
    }
    
    var missionPatch: String {
        data?.links?.missionPatchSmall ?? ""
    }
    
    init(data: LaunchesQuery.Data.Launch?, indexPath: IndexPath) {
        self.data = data
        self.indexPath = indexPath
    }
}
