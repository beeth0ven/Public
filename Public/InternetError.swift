//
//  InternetError.swift
//  Experiment Go
//
//  Created by luojie on 15/12/10.
//  Copyright © 2015年 LuoJie. All rights reserved.
//

import Foundation

enum InternetError: ErrorType {
    case ParseFailed
    case UserBlocked
    case PasswordIncorrect
    case Other(NSError)
    
    var localizedDescription: String {
        switch self {
        case ParseFailed:
            return "ParseFailed"
        case UserBlocked:
            return "UserBlocked"
        case PasswordIncorrect:
            return "PasswordIncorrent"
        case Other(let error):
            return error.localizedDescription
        }
    }
    
    init(error: NSError) {
        switch error.code {
        case 0:
            self = .ParseFailed
        case 1:
            self = .UserBlocked
        case 2:
            self = .PasswordIncorrect
        default:
            self = .Other(error)
        }
    }
}

