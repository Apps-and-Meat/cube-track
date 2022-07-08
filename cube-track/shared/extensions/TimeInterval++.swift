//
//  TimeInterval++.swift
//  cube-track
//
//  Created by Karl Söderberg on 2022-06-30.
//

import Foundation

extension TimeInterval {
    var durationFormat: String {
        
        let minutes = (self / 60).rounded(.down)
        let seconds = self.truncatingRemainder(dividingBy: 60)
        let miliseconds = seconds.truncatingRemainder(dividingBy: 1) * 100

        let minuteString = String(format: "%02d", Int(minutes))
        let secondString = String(format: "%02d", Int(seconds.rounded(.down)))
        let milisecondString = String(format: "%02d", Int(miliseconds.rounded(.toNearestOrEven)))
        return "\(minuteString):\(secondString):\(milisecondString)"
    }
}

extension Array where Element == TimeInterval {
    var shortest: TimeInterval {
        self.reduce(TimeInterval.infinity) { partialResult, element in
            if element < partialResult {
                return element
            } else {
                return partialResult
            }
        }
    }

    var longest: TimeInterval {
        self.reduce(TimeInterval()) { partialResult, element in
            if element > partialResult {
                return element
            } else {
                return partialResult
            }
        }
    }

    func isShortest(time: TimeInterval) -> Bool {
        time <= self.shortest
    }

    func isLongest(time: TimeInterval) -> Bool {
        time >= self.longest
    }

}
