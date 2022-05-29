//
//  HPAlertControllerView.swift
//  Custom Alert
//
//  Created by Hugo Pivaral on 24/05/22.
//

import UIKit

public class HPAlertController: UIViewController {
    
    // MARK: - PROPERTIES
    
    private var padding: CGFloat = 25

    private var alertTintColor: UIColor!
    
    private var alertIcon: HPAlertIcon!
    
    private var alertTitle: String? {
        get {
            titleLabel.text
        }
        set {
            titleLabel.text = newValue
        }
    }
    
    private var alertMessage: String? {
        get {
            messageLabel.text
        }
        set {
            messageLabel.attributedText = NSAttributedString(string: newValue ?? "", attributes: messageLabelAttributes)
        }
    }
    
    private var messageLabelAttributes: [NSAttributedString.Key : Any] = {
        var attributes: [NSAttributedString.Key : Any] = [:]
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 2
        paragraphStyle.alignment = .center
        
        attributes = [NSAttributedString.Key.foregroundColor : UIColor.gray,
                      NSAttributedString.Key.paragraphStyle : paragraphStyle,
                      NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17.0, weight: .regular) ]
        
        return attributes
    }()
    

    // MARK: - INITIALIZERS
    
    public init(title: String?, message: String?, icon: HPAlertIcon = .none, alertTintColor: HPAlertColor = .default) {
        super.init(nibName: nil, bundle: nil)
        self.alertTintColor = alertTintColor.rawValue
        self.alertMessage = message
        self.alertTitle = title
        self.alertIcon = icon
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    // MARK: - VIEWS
    
    private var cardView: UIView = {
        let cardView = UIView()
        
        cardView.backgroundColor = .hpBackground
        cardView.layer.cornerRadius = 30
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        return cardView
    }()
    
    // Stack views
    
    private var mainStackView: UIStackView = {
        let mainStackView = UIStackView()
        
        mainStackView.spacing = 25
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        return mainStackView
    }()
    
    private var labelsStackView: UIStackView = {
        let labelsStackView = UIStackView()
        
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 15
        labelsStackView.alignment = .fill
        
        return labelsStackView
    }()
    
    private var buttonsStackView: UIStackView = {
        let buttonsStackView = UIStackView()
        
        buttonsStackView.axis = .vertical
        buttonsStackView.spacing = 10
        buttonsStackView.alignment = .fill
        buttonsStackView.distribution = .fillEqually
        
        return buttonsStackView
    }()
    
    // Labels
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        
        titleLabel.font = UIFont.systemFont(ofSize: 22.0, weight: .semibold)
        titleLabel.textColor = alertTintColor
        titleLabel.numberOfLines = 1
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLabel
    }()
    
    private var messageLabel: UILabel = {
        let messageLabel = UILabel()
        
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return messageLabel
    }()
    
    // Icon
    
    private lazy var iconContainerView: UIView = {
        let iconContainerView = UIView()
        
        iconContainerView.isHidden = alertIcon == HPAlertIcon.none ? true : false
        iconContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        return iconContainerView
    }()
    
    private lazy var iconBackgroundView: UIView = {
        let iconBackgroundView = UIView()
        
        iconBackgroundView.backgroundColor = alertTintColor
        iconBackgroundView.layer.cornerRadius = 65
        iconBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        return iconBackgroundView
    }()
    
    private lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.image = alertIcon.rawValue
        iconImageView.tintColor = .hpLightContent
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        return iconImageView
    }()
    
    
    // MARK: - PRIVATE HELPERS
    
    private func setUp() {
        modalPresentationStyle = .overFullScreen
        modalTransitionStyle = .crossDissolve
        view.backgroundColor = .black.withAlphaComponent(0.6)
        setConstraints()
    }
    
    private func setConstraints() {
        view.addSubview(cardView)
        cardView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        cardView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        cardView.widthAnchor.constraint(equalToConstant: 312).isActive = true
        
        cardView.addSubview(mainStackView)
        mainStackView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: padding).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -padding).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: padding).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -padding).isActive = true
        
        mainStackView.addArrangedSubview(iconContainerView)
        iconContainerView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        
        iconContainerView.addSubview(iconBackgroundView)
        iconBackgroundView.heightAnchor.constraint(equalToConstant: 130).isActive = true
        iconBackgroundView.widthAnchor.constraint(equalToConstant: 130).isActive = true
        iconBackgroundView.centerXAnchor.constraint(equalTo: iconContainerView.centerXAnchor).isActive = true
        iconBackgroundView.centerYAnchor.constraint(equalTo: iconContainerView.centerYAnchor).isActive = true
        
        iconBackgroundView.addSubview(iconImageView)
        iconImageView.widthAnchor.constraint(equalToConstant: 44).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        iconImageView.centerXAnchor.constraint(equalTo: iconBackgroundView.centerXAnchor).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: iconBackgroundView.centerYAnchor).isActive = true
        
        mainStackView.addArrangedSubview(labelsStackView)
        labelsStackView.addArrangedSubview(titleLabel)
        labelsStackView.addArrangedSubview(messageLabel)
        
        mainStackView.addArrangedSubview(buttonsStackView)
    }
    
    
    // MARK: - PUBLIC METHODS
    
    public func addAction(_ action: HPAlertAction) {
        let button = HPAlertActionButton(action: action, tintColor: alertTintColor)
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        button.addAction(UIAction(handler: { [weak self] _ in
            self?.dismiss(animated: true) {
                action.handler()
            }
        }), for: .touchUpInside)
        
        buttonsStackView.addArrangedSubview(button)
    }
}
