//
//  TimeInterval++.swift
//  cube-trackTests
//
//  Created by Karl Söderberg on 2022-06-30.
//

import XCTest
@testable
import cube_track

final class TimeIntervalTests: XCTestCase {

    func testDurationTimeStringWhenZero() {
        let sut = TimeInterval()

        XCTAssertEqual(sut.durationFormat, "00:00:00")
    }

    func testDurationTimeString() {
        var sut = Double()

        sut = 60
        XCTAssertEqual(sut.durationFormat, "01:00:00")

        sut = 30
        XCTAssertEqual(sut.durationFormat, "00:30:00")

        sut = 10.11
        XCTAssertEqual(sut.durationFormat, "00:10:11")

        sut = 121.67
        XCTAssertEqual(sut.durationFormat, "02:01:67")

        sut = 180.03
        XCTAssertEqual(sut.durationFormat, "03:00:03")

        sut = 1800.33
        XCTAssertEqual(sut.durationFormat, "30:00:33")

    }

}
