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
        return String(format: "%.0f:%.2f", minutes, seconds)
    }
}
