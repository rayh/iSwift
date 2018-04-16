//
//  Regex.swift
//  iSwiftCore
//
//  Created by Jin Wang on 24/02/2016.
//  Copyright © 2016 Uthoft. All rights reserved.
//

import Foundation

typealias RegularExpressionMatchingOptions = NSRegularExpression.MatchingOptions

struct Regex {
    var pattern: String {
        didSet {
            updateRegex()
        }
    }
    var expressionOptions: NSRegularExpression.Options {
        didSet {
            updateRegex()
        }
    }
    var matchingOptions: RegularExpressionMatchingOptions

    var regex: NSRegularExpression?

    init(pattern: String, expressionOptions: NSRegularExpression.Options = [.anchorsMatchLines], matchingOptions: RegularExpressionMatchingOptions = RegularExpressionMatchingOptions()) {
        self.pattern = pattern
        self.expressionOptions = expressionOptions
        self.matchingOptions = matchingOptions
        updateRegex()
    }

    mutating func updateRegex() {
        regex = try? NSRegularExpression(pattern: pattern, options: expressionOptions)
    }
}


extension String {
    
    /// NSRange of the full string.
    private var fullRange: NSRange {
        return NSRange(self.startIndex..<self.endIndex, in: self)
    }
    
    func matchRegex(_ pattern: Regex) -> Bool {
        if let regex = pattern.regex {
            let matches = regex.matches(in: self, options: pattern.matchingOptions, range: self.fullRange)
            return matches.count > 0
        }
        return false
    }

    func match(_ patternString: String, options: NSRegularExpression.Options = [.anchorsMatchLines]) -> Bool {
        return self.matchRegex(Regex(pattern: patternString, expressionOptions: options))
    }

    func replaceRegex(_ pattern: Regex, template: String) -> String {
        if self.matchRegex(pattern), let regex = pattern.regex {
            return regex.stringByReplacingMatches(in: self, options: pattern.matchingOptions, range: self.fullRange, withTemplate: template)
        }
        return self
    }

    func replace(_ pattern: String, template: String) -> String {
        return self.replaceRegex(Regex(pattern: pattern), template: template)
    }
}
