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
