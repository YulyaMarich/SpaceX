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
        createAttributedString(launchCellAttributes: .calendar)
    }
    
    var siteName: NSMutableAttributedString {
        createAttributedString(launchCellAttributes: .globe)
    }
     
    var rocketName: String {
        data?.rocket?.rocketName ?? "No info"
    }
    
    var launchSuccess: NSMutableAttributedString {
        createAttributedString(launchCellAttributes: .launchSuccess)
    }
    
    var launchFailure: NSMutableAttributedString {
        createAttributedString(launchCellAttributes: .launchFaillure)
    }
    
    var missionPatch: String {
        data?.links?.missionPatchSmall ?? ""
    }
    
    init(data: LaunchesQuery.Data.Launch?, indexPath: IndexPath) {
        self.data = data
        self.indexPath = indexPath
    }
    
    private func createAttributedString(launchCellAttributes: LaunchCellAttributes) -> NSMutableAttributedString {
        switch launchCellAttributes {
        case .calendar:
            guard let calendarImage = launchCellAttributes.image else { return NSMutableAttributedString()}
            
            let launchDateLocalStringAttributes: [NSAttributedString.Key: Any] = [.font: launchCellAttributes.font as Any]
            let launchDateLocalString = NSAttributedString(string: formatedDate(),
                                                           attributes: launchDateLocalStringAttributes)
            
            let launchDateLocalText = NSMutableAttributedString(attachment: calendarImage)
            launchDateLocalText.append(launchDateLocalString)
            
            return launchDateLocalText
            
        case .globe:
            guard let globeImage = launchCellAttributes.image else { return NSMutableAttributedString()}
            
            let siteNameStringAttributes: [NSAttributedString.Key: Any] = [.font: launchCellAttributes.font as Any]
            let siteNameString = NSAttributedString(string: " \(data?.launchSite?.siteName ?? "No info")",
                                                    attributes: siteNameStringAttributes)
            
            let siteNameText = NSMutableAttributedString(attachment: globeImage)
            siteNameText.append(siteNameString)
            
            return siteNameText
            
        case .launchSuccess:
            guard let launchSuccessImage = launchCellAttributes.image else { return NSMutableAttributedString()}
            let launchSuccessImageString = NSAttributedString(attachment: launchSuccessImage)
            
            let launchSuccessStringAttributes: [NSAttributedString.Key: Any] = [.font: launchCellAttributes.font as Any]
            let launchSuccessString = NSAttributedString(string: "Success ",
                                                         attributes: launchSuccessStringAttributes)
            
            let launchSuccessText = NSMutableAttributedString(string: "")
            launchSuccessText.append(launchSuccessString)
            launchSuccessText.append(launchSuccessImageString)
            
            return launchSuccessText
            
        case .launchFaillure:
            guard let launchFaillureImage = launchCellAttributes.image else { return NSMutableAttributedString()}
            let launchFaillureImageString = NSAttributedString(attachment: launchFaillureImage)
            
            let launchFaillureStringAttributes: [NSAttributedString.Key: Any] = [.font: launchCellAttributes.font as Any]
            let launchFaillureString = NSAttributedString(string: "Failure ",
                                                          attributes: launchFaillureStringAttributes)
            
            let launchFaillureText = NSMutableAttributedString(string: "")
            launchFaillureText.append(launchFaillureString)
            launchFaillureText.append(launchFaillureImageString)
            
            return launchFaillureText
        }
    }
    
    private func formatedDate() -> String {
        guard let initialData = data?.launchDateLocal else { return "" }
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let date = dateFormatter.date(from: initialData)!
        dateFormatter.dateFormat = " MMMM e, yyyy"
        
        return dateFormatter.string(from: date)
    }
}
