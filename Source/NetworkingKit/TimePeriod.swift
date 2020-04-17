//
//  TimePeriod.swift
//  NetworkingKit
//
//  Created by Stoyan Stoyanov on 30/05/2019.
//  Copyright © 2019 Stoyan Stoyanov. All rights reserved.
//

import Foundation


// MARK: - Time Intervals

/// Enum that stores time in humanly readable formats and it is capable of producing `TimeInterval`.
///
/// - miliseconds: Use that when you want to represent milliseconds.
/// - seconds: Use that when you want to represent seconds.
/// - minutes: Use that when you want to represent minutes.
/// - hours: Use that when you want to represent hours.
/// - days: Use that when you want to represent days.
public enum TimePeriod {
    
    /// Use that when you want to represent milliseconds.
    case miliseconds(Int)
    
    /// Use that when you want to represent seconds.
    case seconds(Int)
    
    /// Use that when you want to represent minutes.
    case minutes(Double)
    
    /// Use that when you want to represent hours.
    case hours(Double)
    
    /// Use that when you want to represent days.
    case days(Double)
    
}

// MARK: - Convenience Translations

extension TimePeriod {
    
    /// Gets the raw time duration as `TimeInterval`.
    var interval: TimeInterval {
        
        switch self {
        case .miliseconds(let ms):  return TimeInterval(Double(ms) / 1000.0)
        case .seconds(let sec):     return TimeInterval(sec)
        case .minutes(let min):     return TimeInterval(min * 60.0)
        case .hours(let hr):        return TimeInterval(hr * 60.0 * 60.0)
        case .days(let day):        return TimeInterval(day * 60.0 * 60.0 * 24)
        }
    }
}
