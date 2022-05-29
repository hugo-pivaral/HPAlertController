//
//  HPAlertAction.swift
//  Custom Alert
//
//  Created by Hugo Pivaral on 25/05/22.
//

import UIKit

class HPAlertAction: NSObject {
    
    private(set) var title: String!
    private(set) var style: HPAlertAction.Style!
    private(set) var handler: () -> Void
    
    init(title: String, style: HPAlertAction.Style = .default, handler: @escaping () -> Void = {}) {
        self.title = title
        self.style = style
        self.handler = handler
    }
}

extension HPAlertAction {
    public enum Style {
        case `default`
        case cancel
        case destructive
    }
}
