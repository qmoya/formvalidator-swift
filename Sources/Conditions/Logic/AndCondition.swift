//
//  AndCondition.swift
//  FormValidatorSwift
//
//  Created by Aaron McTavish on 13/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import Foundation


/**
 *  A condition that returns the result of either operands.
 */
public struct AndCondition: Condition {
    
    
    // MARK: - Properties
    
    public var localizedViolationString = ""
    
    public let regex = ""
    
    public var shouldAllowViolation = true
    
    public let conditions: [Condition]
    
    
    // MARK: - Initializers
    
    public init() {
        self.init(conditions: [AlphanumericCondition()])
    }
    
    public init(conditions: [Condition]) {
        self.conditions = conditions
    }
    
    
    // MARK: - Check
    
    public func check(_ text: String?) -> Bool {
        return conditions.reduce(true, { $0 && $1.check(text) })
    }
    
}
