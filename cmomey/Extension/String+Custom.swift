//
//  String+Custom.swift
//  cmomey
//
//  Created by Wii Lin on 2021/7/15.
//

import Foundation

extension String {
    func date(with dateFormat: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.date(from: self)
    }
}
