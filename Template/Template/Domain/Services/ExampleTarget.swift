//
//  Network.swift
//  Template
//
//  Created by Lam Nguyen on 5/7/22.
//

import Foundation
import Moya

public enum ExampleTarget {
  case users
  case details
}

extension ExampleTarget: TargetType {
  public var baseURL: URL {
    URL(string: "https://jsonplaceholder.typicode.com")!
  }

  public var path: String {
    switch self {
    case .users: return "/users"
    case .details: return "/details"
    }
  }

  public var method: Moya.Method {
    switch self {
    case .users:
      return .get
    default:
      return .post
    }
  }

  public var task: Task {
    .requestPlain
  }

  public var headers: [String: String]? {
    ["Content-Type": "application/json"]
  }

  public var validationType: ValidationType {
    .successCodes
  }
}
