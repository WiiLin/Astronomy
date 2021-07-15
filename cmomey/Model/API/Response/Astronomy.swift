//
//  Astronomy.swift
//  AmazingTalker
//
//  Created by Wii Lin on 2020/11/10.
//
import Foundation

struct Astronomy: Decodable {
    let description: String
    let copyright: String
    let title: String
    let url: URL
    let apodSite: URL
    let date: String
    let mediaType: String
    let hdurl: String

    var displayDate: String {
        if let date = date.date(with: "YYYY-MM-DD") {
            return date.dateString(with: "YYYY MMM. dd")
        } else {
            return date
        }
    }
}
