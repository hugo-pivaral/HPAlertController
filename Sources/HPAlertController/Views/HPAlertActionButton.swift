//
//  HPAlertActionButton.swift
//  Custom Alert
//
//  Created by Hugo Pivaral on 25/05/22.
//

import UIKit

internal class HPAlertActionButton: UIButton {
    
    // MARK: - PROPERTIES
    
    private var action: HPAlertAction!
    
    private lazy var buttonBackgroundColor: UIColor = {
        var buttonBackgroundColor = UIColor()
        
        switch action.style {
        case .default:
            buttonBackgroundColor = tintColor
        case .cancel:
            buttonBackgroundColor = tintColor.withAlphaComponent(0.15)
        case .destructive:
            buttonBackgroundColor = .hpDestructive.withAlphaComponent(0.15)
        case .none:
            break
        }
        
        return buttonBackgroundColor
    }()
    
    private lazy var buttonTextColor: UIColor = {
        var buttonTextColor = UIColor()
        
        switch action.style {
        case .default:
            buttonTextColor = .hpLightContent
        case .cancel:
            buttonTextColor = tintColor
        case .destructive:
            buttonTextColor = .hpDestructive
        case .none:
            break
        }
        
        return buttonTextColor
    }()
    
    
    // MARK: - INITIALIZERS
    
    convenience init(action: HPAlertAction, tintColor: UIColor) {
        self.init(type: .custom)
        self.action = action
        self.tintColor = tintColor
        self.configureButton()
    }
    
    
    // MARK: - HELPERS
    
    func configureButton() {
        setTitle(action.title, for: .normal)
        setTitleColor(buttonTextColor, for: .normal)
        setTitleColor(buttonTextColor.withAlphaComponent(0.6), for: .highlighted)
        titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        backgroundColor = buttonBackgroundColor
        layer.cornerRadius = 30
        
    }
}
