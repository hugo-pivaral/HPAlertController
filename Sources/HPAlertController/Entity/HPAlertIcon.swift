//
//  HPAlertIcon.swift
//  Custom Alert
//
//  Created by Hugo Pivaral on 28/05/22.
//

import UIKit

public enum HPAlertIcon: Equatable {
    case error
    case info
    case success
    case custom(UIImage)
    case none
    
    public var rawValue: UIImage? {
        switch self {
        case .error:
            return UIImage(named: "error")
        case .info:
            return UIImage(named: "info")
        case .success:
            return UIImage(named: "success")
        case .custom(let icon):
            return icon
        case .none:
            return nil
        }
    }
}
