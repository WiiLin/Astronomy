//
//  FakeAPIHandler.swift
//  AmazingTalker
//
//  Created by Wii Lin on 2021/7/9.
//

import Foundation

class FakeAPIHandler: APIRequestable {
    private lazy var parseHandler = APIParseHandler()

    func getAstronomyList(completionHandler: @escaping (Result<[Astronomy], APIError>) -> Void) {
        let api = AstronomyListRequest()
        parseHandler.parse(api.path.testData, responseType: [Astronomy].self, completionHandler: completionHandler)
    }
}
