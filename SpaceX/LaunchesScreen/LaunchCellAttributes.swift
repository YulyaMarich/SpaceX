//
//  LaunchCellAttributes.swift
//  SpaceX
//
//  Created by Julia on 15.08.2022.
//

import UIKit

enum LaunchCellAttributes {
    case calendar
    case globe
    case launchSuccess
    case launchFaillure
    
    var image: NSTextAttachment? {
        switch self {
        case .calendar:
            let calendar = NSTextAttachment()
            calendar.image = UIImage(named:"calendar")?.withTintColor(.sxItemColor)
            
            let imageOffsetY: CGFloat = -2.5
            calendar.bounds = CGRect(x: 0, y: imageOffsetY, width: 15, height: 15)
            
            return calendar
        case .globe:
            let globe = NSTextAttachment()
            globe.image = UIImage(named:"globe")?.withTintColor(.sxItemColor)
            
            let imageOffsetY: CGFloat = -2.5
            globe.bounds = CGRect(x: 0, y: imageOffsetY, width: 15, height: 15)
            
            return globe
        case .launchSuccess:
            let checkmark = NSTextAttachment()
            checkmark.image = UIImage(named:"checkmark")?.withTintColor(.sxGreen)
            
            let imageOffsetY: CGFloat = -6
            checkmark.bounds = CGRect(x: 0, y: imageOffsetY, width: 22, height: 22)
            
            return checkmark
        case .launchFaillure:
            let xmark = NSTextAttachment()
            xmark.image = UIImage(named:"xmark")?.withTintColor(.sxRed)
            
            let imageOffsetY: CGFloat = -6
            xmark.bounds = CGRect(x: 0, y: imageOffsetY, width: 22, height: 22)
            
            return xmark
        }
    }
    
    var font: UIFont? {
        switch self {
        case .calendar, .globe:
            return UIFont(name: "Inter-Regular", size: 12)
        case .launchSuccess, .launchFaillure:
            return UIFont(name: "Inter-Regular", size: 12)
        }
    }
}

