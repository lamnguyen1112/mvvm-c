//
//  ExampleAdapter.swift
//  Template
//
//  Created by Lam Nguyen on 5/19/22.
//

import Foundation
import Moya

class ExampleService {
  let provider = MoyaProvider<ExampleTarget>(endpointClosure: { (target: ExampleTarget) -> Endpoint in
    let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
    switch target {
    default:
      let httpHeaderFields = ["Content-Type": "application/json"]
      return defaultEndpoint.adding(newHTTPHeaderFields: httpHeaderFields)
    }
  }, plugins: [
    //        NetworkLoggerPlugin(configuration: .init(formatter: .init(), output: { (target, array) in
//            if let log = array.first {
//                print("----------------------- cURL ------------------------")
//                print(log)
//            }
//        }, logOptions: .formatRequestAscURL))
  ])

  let domain: String = "com.example.helloworld"

  func request(target: ExampleTarget,
               success successCallback: @escaping (Response) -> Void,
               error errorCallback: @escaping (Swift.Error) -> Void,
               failure failureCallback: @escaping (MoyaError) -> Void)
  {
    provider.request(target) { [weak self] result in
      guard let self = self else {
        return
      }

      switch result {
      case let .success(response):
//                self.showLog(response)

        if response.statusCode >= 200, response.statusCode <= 300 {
          successCallback(response)
        } else {
          let error = NSError(domain: self.domain, code: 0, userInfo: [NSLocalizedDescriptionKey: "Parsing Error"])
          errorCallback(error)
        }
      case let .failure(error):
        failureCallback(error)
      }
    }
  }

  private func showcURLLog() {}

  private func showLog(_ response: Response) {
    do {
      let json = try response.mapJSON()
      print("----------------------- RESPONSE ------------------------")
      print(json)
    } catch {
      print(error)
    }
  }
}
