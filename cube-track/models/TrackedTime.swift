//
//  TrackedTime.swift
//  cube-track
//
//  Created by Karl Söderberg on 2022-06-29.
//

import Foundation

struct TrackedTime: Hashable, Identifiable {
    var id: Date { startDate }
    let startDate: Date
    let endDate: Date

    var timeScore: TimeInterval {
        endDate.timeIntervalSince(startDate)
    }
}
