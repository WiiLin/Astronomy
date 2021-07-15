//
//  Date+Custom.swift
//  cmomey
//
//  Created by Wii Lin on 2021/7/15.
//

import Foundation

extension Date {
    func dateString(with dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
}
