//
//  Colors.swift
//  Custom Alert
//
//  Created by Hugo Pivaral on 26/05/22.
//

import UIKit

public enum HPAlertColor: Equatable {
    case `default`
    case custom(UIColor)
    
    public var rawValue: UIColor {
        switch self {
        case .default:
            return UIColor(named: "default") ?? .black
        case .custom(let color):
            return color
        }
    }
}


extension UIColor {
    internal static let hpDestructive = UIColor(named: "destructive") ?? .black
    internal static let hpBackground = UIColor(named: "background") ?? .black
    internal static var hpLightContent = UIColor(named: "lightContent") ?? .black
}
