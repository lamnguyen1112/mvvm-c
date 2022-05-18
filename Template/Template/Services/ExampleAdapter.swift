//
//  ExampleAdapter.swift
//  Template
//
//  Created by Lam Nguyen on 5/19/22.
//

import Foundation
import Moya

struct ExampleAdapter {
    static let provider = MoyaProvider<ExampleService>()
    static let domain: String = "com.example.helloworld"
    
    static func request(target: ExampleService,
                        success successCallback: @escaping (Response) -> Void,
                        error errorCallback: @escaping (Swift.Error) -> Void,
                        failure failureCallback: @escaping (MoyaError) -> Void) {
        provider.request(target) { (result) in
            switch result {
            case .success(let response):
                if response.statusCode >= 200 && response.statusCode <= 300 {
                    successCallback(response)
                } else {
                    let error = NSError(domain: domain, code: 0, userInfo: [NSLocalizedDescriptionKey: "Parsing Error"])
                    errorCallback(error)
                }
            case .failure(let error):
                failureCallback(error)
            }
        }
    }
}
