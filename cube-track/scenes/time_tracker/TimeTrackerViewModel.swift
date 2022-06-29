//
//  TimeTrackerViewModel.swift
//  cube-track
//
//  Created by Karl Söderberg on 2022-06-29.
//

import Foundation

class TimeTrackerViewModel: ObservableObject {

    @Published
    var startTime: Date?
    @Published
    var endTime: Date?
    @Published
    var time = TimeInterval()
    @Published
    var trackedTimes = [TrackedTime]()
    @Published
    var trackedSet: TrackedSet?
    @Published
    var isTracking = false
    @Published
    private var timer: Timer?


    init() {
        $startTime
            .combineLatest($endTime)
            .receive(on: RunLoop.main)
            .map { $0.0 != nil && $0.1 == nil }
            .assign(to: &$isTracking)

        $startTime
            .combineLatest($endTime)
            .receive(on: RunLoop.main)
            .compactMap {
                guard let startTime = $0.0, let endTime = $0.1 else {
                    return nil
                }
                return TrackedTime(startDate: startTime, endDate: endTime)
            }
            .map { (trackedTime: TrackedTime) in
                var trackedTimes = self.trackedTimes
                trackedTimes.append(trackedTime)
                return trackedTimes
            }
            .assign(to: &$trackedTimes)

        $trackedTimes
            .receive(on: RunLoop.main)
            .filter {
                $0.count >= 5
            }
            .compactMap {
                guard let startTime = $0.first?.startDate else { return nil }
                return TrackedSet(startDate: startTime, timeScores: $0)
            }
            .assign(to: &$trackedSet)
        
    }


    func startTimer() {
        endTime = nil
        startTime = .now

        timer = .scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [unowned self] _ in
            guard let startTime = self.startTime else { return }

            time = Date.now.timeIntervalSince(startTime)
        })
    }

    func endTimer() {
        timer?.invalidate()
        timer = nil
        let endTime = Date.now
        self.endTime = endTime

        guard let startTime = self.startTime else { return }
        self.time = endTime.timeIntervalSince(startTime)

    }

    func saveResults() {
        resetTracker()
    }

    func discardResults() {
        resetTracker()
    }

    private func resetTracker() {
        endTime = nil
        startTime = nil
        timer = nil
        trackedTimes = []
        trackedSet = nil
    }

}
