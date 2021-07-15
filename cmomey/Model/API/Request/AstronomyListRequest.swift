//
//  Api.swift
//  AmazingTalker
//
//  Created by Wii Lin on 2021/7/8.
//

import Foundation

struct AstronomyListRequest: Requestable, Encodable {
    typealias ApiResponse = [Astronomy]
    var path: APIPath { return .astronomyList }
    var method: HTTPMethod { return .get }
    var request: Encodable? { return self }
}
