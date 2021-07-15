//
//  Encodable+Parameters.swift
//  cmomey
//
//  Created by Wii Lin on 2021/7/15.
//

import Foundation

extension Encodable {
    func parameters(keyEncodingStrategy: JSONEncoder.KeyEncodingStrategy) -> Parameters? {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.keyEncodingStrategy = keyEncodingStrategy
        guard let data = try? jsonEncoder.encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? Parameters }
    }
}
