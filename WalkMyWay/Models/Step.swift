//
//  Step.swift
//  WalkMyWay
//
//  Created by Thomas Cowern on 10/29/23.
//

import Foundation

struct Step: Identifiable {
    let id = UUID()
    let count: Int
    let date: Date
}
