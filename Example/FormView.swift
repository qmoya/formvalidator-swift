//
//  FormView.swift
//  iOS Example
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import UIKit

import FormValidatorSwift


final class FormView: UIView {
    
    
    // MARK: - Properties
    
    let nameEntry       = FormEntryView<AlphabeticValidator>()
    let emailEntry      = FormEntryView<EmailValidator>()
    
    let submitButton    = UIButton(type: .system)
    
    fileprivate let bottomBufferView    = UIView()
    fileprivate let stackView           = UIStackView()
    
    
    // MARK: - Initializers
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.white
        
        
        // Setup
        
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        addSubview(stackView)
        
        nameEntry.textLabel.text = NSLocalizedString("Surname", comment: "")
        stackView.addArrangedSubview(nameEntry)
        
        emailEntry.textLabel.text = NSLocalizedString("Email", comment: "")
        emailEntry.textField.shouldAllowViolation = true
        emailEntry.textField.validateOnFocusLossOnly = true
        stackView.addArrangedSubview(emailEntry)
        
        submitButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        submitButton.setTitle(NSLocalizedString("Submit", comment: ""), for: UIControlState())
        stackView.addArrangedSubview(submitButton)
        
        bottomBufferView.setContentCompressionResistancePriority(UILayoutPriorityDefaultLow, for: stackView.axis)
        bottomBufferView.setContentHuggingPriority(UILayoutPriorityDefaultLow, for: stackView.axis)
        stackView.addArrangedSubview(bottomBufferView)
        
        
        // Accessibility
        
        nameEntry.textLabel.accessibilityIdentifier = FormAccessibility.Identifiers.NameLabel
        nameEntry.textField.accessibilityIdentifier = FormAccessibility.Identifiers.NameTextField
        
        emailEntry.textLabel.accessibilityIdentifier = FormAccessibility.Identifiers.EmailLabel
        emailEntry.textField.accessibilityIdentifier = FormAccessibility.Identifiers.EmailTextField
        
        submitButton.accessibilityIdentifier = FormAccessibility.Identifiers.SubmitButton
        
        
        // Layout
        
        let stackViewMargin: CGFloat = 20.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint(item: stackView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: stackViewMargin))
        addConstraint(NSLayoutConstraint(item: stackView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: stackViewMargin))
        addConstraint(NSLayoutConstraint(item: stackView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -stackViewMargin))
        addConstraint(NSLayoutConstraint(item: stackView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: -stackViewMargin))
        
        stackView.spacing = stackViewMargin
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
