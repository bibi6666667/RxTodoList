//
//  Task.swift
//  GoodList
//
//  Created by Bibi on 2022/12/19.
//

import Foundation

enum Priority: Int {
    case high
    case medium
    case low
}

struct Task {
    let title: String
    let priority: Priority
}
