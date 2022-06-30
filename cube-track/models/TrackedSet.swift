//
//  TrackedSet.swift
//  cube-track
//
//  Created by Karl Söderberg on 2022-06-29.
//

import Foundation

struct TrackedSet: Hashable, Identifiable, Codable {
    var id: Date { startDate }
    let startDate: Date

    let timeScores: [TrackedTime]

    var totalTime: TimeInterval {
        timeScores.reduce(Double()) { partialResult, trackedtime in
            partialResult + trackedtime.timeScore
        }
    }

    var medianTime: TimeInterval {
        if timeScores.isEmpty {
            return 0
        }

        return totalTime / Double(timeScores.count)
    }
}
