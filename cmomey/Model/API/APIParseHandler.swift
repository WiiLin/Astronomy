//
//  APIParseHandler.swift
//  AmazingTalker
//
//  Created by Wii Lin on 2021/7/8.
//

import Foundation

class APIParseHandler {
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()

    func parse<ApiResponse: Decodable>(_ data: Data?,
                                       responseType: ApiResponse.Type,
                                       completionHandler: @escaping (Result<ApiResponse, APIError>) -> Void) {
        if let data = data {
            do {
                let response = try jsonDecoder.decode(responseType, from: data)
                completionHandler(.success(response))
            } catch {
                print("\(error.localizedDescription)")
                completionHandler(.failure(.custom((error as NSError).localizedDescription)))
            }
        } else {
            completionHandler(.failure(.apiResponseSourceError))
        }
    }
}
