//
//  URL+Custom.swift
//  cmomey
//
//  Created by Wii Lin on 2021/7/15.
//

import Foundation

extension URL {
    static let apiHost: URL = URL(string: "https://raw.githubusercontent.com")!

    static func apiURL(path: APIPath) -> URL? {
        if var urlComponents: URLComponents = URLComponents(url: apiHost, resolvingAgainstBaseURL: true) {
            urlComponents.path = path.path
            return urlComponents.url
        } else {
            return nil
        }
    }
}
