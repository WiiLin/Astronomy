//
//  ATAPIManager.swift
//  AmazingTalker
//
//  Created by Wii Lin on 2021/7/9.
//

import Foundation

class APIHandler: APIRequestable {
    private lazy var requestHandler: APIRequestHandler = APIRequestHandler()
    func getAstronomyList(completionHandler: @escaping (Result<[Astronomy], APIError>) -> Void) {
        let api = AstronomyListRequest()
        requestHandler.request(api,
                               responseType: [Astronomy].self,
                               completionHandler: completionHandler)
    }
}
