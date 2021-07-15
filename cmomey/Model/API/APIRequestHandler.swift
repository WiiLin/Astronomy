//
//  APIRequestHandler.swift
//  AmazingTalker
//
//  Created by Wii Lin on 2021/7/8.
//

import Foundation

class APIRequestHandler {
    private lazy var parseHandler = APIParseHandler()

    func request<ApiRequest: Requestable, ApiResponse: Decodable>(_ apiRequest: ApiRequest,
                                                                  responseType: ApiResponse.Type,
                                                                  completionHandler: @escaping (Result<ApiResponse, APIError>) -> Void) {
        guard let url = URL.apiURL(path: apiRequest.path) else {
            completionHandler(.failure(.urlCreateError))
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                completionHandler(.failure(.custom(error.localizedDescription)))
            } else if let data = data {
                self.parseHandler.parse(data, responseType: responseType, completionHandler: completionHandler)
            } else {
                completionHandler(.failure(.apiResponseSourceError))
            }
        }
        task.resume()
    }
}
