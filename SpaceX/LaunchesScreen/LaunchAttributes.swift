//
//  LaunchAttributes.swift
//  SpaceX
//
//  Created by Julia on 15.08.2022.
//

import UIKit

enum LaunchAttributes {
    case calendar(imageSize: CGFloat, fontSize: CGFloat, imageOffset: CGFloat)
    case globe(imageSize: CGFloat, fontSize: CGFloat, imageOffset: CGFloat)
    case launchSuccess(imageSize: CGFloat, fontSize: CGFloat, imageOffset: CGFloat)
    case launchFaillure(imageSize: CGFloat, fontSize: CGFloat, imageOffset: CGFloat)
    
    var image: NSTextAttachment? {
        switch self {
        case .calendar(let imageSize, _, let imageOffset):
            let calendar = NSTextAttachment()
            calendar.image = UIImage(named:"calendar")?.withTintColor(.sxItemColor)
            calendar.bounds = CGRect(x: 0, y: imageOffset, width: imageSize, height: imageSize)
            
            return calendar
        case .globe(let imageSize, _, let imageOffset):
            let globe = NSTextAttachment()
            globe.image = UIImage(named:"globe")?.withTintColor(.sxItemColor)
            globe.bounds = CGRect(x: 0, y: imageOffset, width: imageSize, height: imageSize)
            
            return globe
        case .launchSuccess(let imageSize, _, let imageOffset):
            let checkmark = NSTextAttachment()
            checkmark.image = UIImage(named:"checkmark")?.withTintColor(.sxGreen)
            checkmark.bounds = CGRect(x: 0, y: imageOffset, width: imageSize, height: imageSize)
            
            return checkmark
        case .launchFaillure(let imageSize, _, let imageOffset):
            let xmark = NSTextAttachment()
            xmark.image = UIImage(named:"xmark")?.withTintColor(.sxRed)
            xmark.bounds = CGRect(x: 0, y: imageOffset, width: imageSize, height: imageSize)
            
            return xmark
        }
    }
    
    var font: UIFont? {
        switch self {
        case .calendar(_, let fontSize, _), .globe(_, let fontSize, _), .launchSuccess(_, let fontSize, _), .launchFaillure(_, let fontSize, _):
            return UIFont(name: "Inter-Regular", size: fontSize)
        }
    }
}

extension String {
    func createAttributedString(launchCellAttributes: LaunchAttributes) -> NSMutableAttributedString {
        switch launchCellAttributes {
        case .calendar:
            guard let calendarImage = launchCellAttributes.image else { return NSMutableAttributedString()}
            
            let launchDateLocalStringAttributes: [NSAttributedString.Key: Any] = [.font: launchCellAttributes.font as Any]
            let launchDateLocalString = NSAttributedString(string: formatedDate(text: self),
                                                           attributes: launchDateLocalStringAttributes)
            
            let launchDateLocalText = NSMutableAttributedString(attachment: calendarImage)
            launchDateLocalText.append(launchDateLocalString)
            
            return launchDateLocalText
            
        case .globe:
            guard let globeImage = launchCellAttributes.image else { return NSMutableAttributedString()}
            
            let siteNameStringAttributes: [NSAttributedString.Key: Any] = [.font: launchCellAttributes.font as Any]
            let siteNameString = NSAttributedString(string: " " + self,
                                                    attributes: siteNameStringAttributes)
            
            let siteNameText = NSMutableAttributedString(attachment: globeImage)
            siteNameText.append(siteNameString)
            
            return siteNameText
            
        case .launchSuccess:
            guard let launchSuccessImage = launchCellAttributes.image else { return NSMutableAttributedString()}
            let launchSuccessImageString = NSAttributedString(attachment: launchSuccessImage)
            
            let launchSuccessStringAttributes: [NSAttributedString.Key: Any] = [.font: launchCellAttributes.font as Any]
            let launchSuccessString = NSAttributedString(string: self,
                                                         attributes: launchSuccessStringAttributes)
            
            let launchSuccessText = NSMutableAttributedString(string: "")
            launchSuccessText.append(launchSuccessString)
            launchSuccessText.append(launchSuccessImageString)
            
            return launchSuccessText
            
        case .launchFaillure:
            guard let launchFaillureImage = launchCellAttributes.image else { return NSMutableAttributedString()}
            let launchFaillureImageString = NSAttributedString(attachment: launchFaillureImage)
            
            let launchFaillureStringAttributes: [NSAttributedString.Key: Any] = [.font: launchCellAttributes.font as Any]
            let launchFaillureString = NSAttributedString(string: self,
                                                          attributes: launchFaillureStringAttributes)
            
            let launchFaillureText = NSMutableAttributedString(string: "")
            launchFaillureText.append(launchFaillureString)
            launchFaillureText.append(launchFaillureImageString)
            
            return launchFaillureText
        }
    }
    
    private func formatedDate(text: String?) -> String {
        guard let initialData = text else { return "" }
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let date = dateFormatter.date(from: initialData)!
        dateFormatter.dateFormat = " MMMM e, yyyy"
        
        return dateFormatter.string(from: date)
    }
}
