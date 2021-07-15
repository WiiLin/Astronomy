//
//  Cancellable.swift
//  cmomey
//
//  Created by Wii Lin on 2021/7/15.
//

import Foundation

protocol Cancellable {
    func cancel()
}

extension URLSessionTask: Cancellable {}
