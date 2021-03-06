//
//  Network.swift
//  Template
//
//  Created by Lam Nguyen on 5/7/22.
//

import Moya

public enum ExampleTarget {
    case users
    case details
}

extension ExampleTarget: TargetType {
    public var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com")!
    }
    
    public var path: String {
        switch self {
        case .users: return "/users"
        case .details: return "/details"
        }
    }
    
    public var method: Method {
        switch self {
        case .users:
            return .get
        default:
            return .post
        }
    }
    
    public var task: Task {
        return .requestPlain
    }
    
    public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}
