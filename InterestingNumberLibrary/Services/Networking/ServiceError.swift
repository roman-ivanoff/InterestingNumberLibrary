//
//  ServiceError.swift
//  iOS_task3.2
//
//  Created by Roman Ivanov on 03.01.2023.
//

import Foundation

public enum ServiceError: Error, LocalizedError {
    case invalidURL
    case invalidResponseStatus
    case dataTaskError(String)
    case corruptData
    case decodingError(String)

    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The endpoint URL is invalid"
        case .invalidResponseStatus:
            return "The APIO failed to issue a valid response."
        case .dataTaskError(let string):
            return string
        case .corruptData:
            return "The data provided appears to be corrupt"
        case .decodingError(let string):
            return string
        }
    }
}
