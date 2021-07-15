//
//  APIPath.swift
//  AmazingTalker
//
//  Created by Wii Lin on 2021/7/9.
//

import Foundation

enum APIPath: String, Equatable {
    case astronomyList

    var path: String {
        switch self {
        case .astronomyList:
            return "/cmmobile/NasaDataSet/main/apod.json"
        }
    }

    var testData: Data? {
        guard let path = Bundle.main.path(forResource: rawValue, ofType: "json") else { return nil }
        return try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
    }
}
