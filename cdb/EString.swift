//
//  EString.swift
//  cdb
//
//  Created by Brain Liao on 2017/12/23.
//  Copyright © 2017年 cdb. All rights reserved.
//


import Foundation

extension String
{
    var length: Int {
        get {
            return self.characters.count
        }
    }
    
    func contains(_ s: String) -> Bool
    {
        return (self.range(of: s) != nil) ? true : false
    }
    
    func replace(_ target: String, withString: String) -> String
    {
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }
    
    subscript (i: Int) -> Character
    {
        get {
            let index = characters.index(startIndex, offsetBy: i) //advancedBy(startIndex, i)
            return self[index]
        }
    }
    
    subscript (r: Range<Int>) -> String
    {
        get {
            let startIndex = self.characters.index(self.startIndex, offsetBy: r.lowerBound)
            //advance(self.startIndex, r.startIndex)
            let endIndex = self.characters.index(self.startIndex, offsetBy: r.upperBound - 1)
            //advance(self.startIndex, r.endIndex - 1)
            
            return self[(startIndex ..< endIndex)]
        }
    }
    
    func subString(_ startIndex: Int, length: Int) -> String
    {
        let start = self.characters.index(self.startIndex, offsetBy: startIndex)
        let end = self.characters.index(self.startIndex, offsetBy: startIndex + length)
        return self.substring(with: (start ..< end))
    }
    
    func indexOf(_ target: String) -> Int
    {
        let range = self.range(of: target)
        if let range = range {
            return self.characters.distance(from: self.startIndex, to: range.lowerBound)
        } else {
            return -1
        }
    }
    
    func indexOf(_ target: String, startIndex: Int) -> Int
    {
        let startRange = self.characters.index(self.startIndex, offsetBy: startIndex)
        
        let range = self.range(of: target, options: NSString.CompareOptions.literal, range: (startRange ..< self.endIndex))
        
        if let range = range {
            return self.characters.distance(from: self.startIndex, to: range.lowerBound)
        } else {
            return -1
        }
    }
    
    func lastIndexOf(_ target: String) -> Int
    {
        var index = -1
        var stepIndex = self.indexOf(target)
        while stepIndex > -1
        {
            index = stepIndex
            if stepIndex + target.length < self.length {
                stepIndex = indexOf(target, startIndex: stepIndex + target.length)
            } else {
                stepIndex = -1
            }
        }
        return index
    }
    
    func isMatch(_ regex: String, options: NSRegularExpression.Options) -> Bool
    {
        var matchCount:Int = 0
        do {
            let exp = try NSRegularExpression(pattern: regex, options: options)
            
            // *****
            matchCount = exp.numberOfMatches(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.length))
            
            //exp.numberOfMatchesInString(self, options: nil, range: NSMakeRange(0, self.length))
        }
        catch let error as NSError {
            print(error.description)
        }
        
        
        return matchCount > 0
    }
    
    func getMatches(_ regex: String, options: NSRegularExpression.Options) -> [NSTextCheckingResult]
    {
        var matches:[NSTextCheckingResult]!
        do {
            let exp = try NSRegularExpression(pattern: regex, options: options)
            //*****
            matches = exp.matches(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.length))
            
        }
        catch let error as NSError {
            print(error.description)
        }
        
        return matches
    }
    
    fileprivate var vowels: [String]
    {
        get
        {
            return ["a", "e", "i", "o", "u"]
        }
    }
    
    fileprivate var consonants: [String]
    {
        get
        {
            return ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "z"]
        }
    }
    
    func pluralize(_ count: Int) -> String
    {
        if count == 1 {
            return self
        } else {
            return self
        }
    }
}

