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
}
