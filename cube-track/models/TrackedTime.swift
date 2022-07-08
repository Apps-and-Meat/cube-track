//
//  TrackedTime.swift
//  cube-track
//
//  Created by Karl Söderberg on 2022-06-29.
//

import Foundation

struct TrackedTime: Hashable, Identifiable, Codable {
    var id: Date { startDate }
    let startDate: Date
    let endDate: Date

    var timeScore: TimeInterval {
        endDate.timeIntervalSince(startDate)
    }
}

extension Array where Element == TrackedTime {

    func isShortest(time: TrackedTime) -> Bool {
        let durations = self.map { $0.timeScore }
        return time.timeScore <= durations.shortest
    }

    func isLongest(time: TrackedTime) -> Bool {
        let durations = self.map { $0.timeScore }
        return time.timeScore >= durations.longest
    }

}
