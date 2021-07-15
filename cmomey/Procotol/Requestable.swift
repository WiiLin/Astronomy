//
//  Requestable.swift
//  AmazingTalker
//
//  Created by Wii Lin on 2021/7/9.
//

import Foundation

protocol Requestable {
    associatedtype ApiResponse: Decodable
    var request: Encodable? { get }
    var path: APIPath { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
}

extension Requestable where Self: Encodable {
    var parameters: Parameters? {
        if let request = request, let parameters = request.parameters(keyEncodingStrategy: .convertToSnakeCase), !parameters.isEmpty {
            return parameters
        } else {
            return nil
        }
    }
}
