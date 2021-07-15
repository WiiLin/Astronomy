//
//  APIRequestable.swift
//  AmazingTalker
//
//  Created by Wii Lin on 2021/7/9.
//

import Foundation

protocol APIRequestable {
    func getAstronomyList(completionHandler: @escaping (Result<[Astronomy], APIError>) -> Void)
}
