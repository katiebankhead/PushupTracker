//
//  PushupTally.swift
//  PushupTracker
//
//  Created by Katie Bankhead on 10/26/21.
//

import Foundation

struct PushupTally: Identifiable, Codable {
    var id = UUID()
    var count: Int
    var date: Date
}
