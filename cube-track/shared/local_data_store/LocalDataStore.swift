//
//  LocalDataStore.swift
//  cube-track
//
//  Created by Karl Söderberg on 2022-06-30.
//

import Foundation
import Combine
import SwiftUI

protocol LocalDataStore {

    var sets: CurrentValueSubject<[TrackedSet], Never> { get }

    func saveTrackedSet(_ set: TrackedSet)
    func setSavedTrackedSets(_ sets: [TrackedSet])
}

extension LocalDataStore {
    static var shared: LocalDataStore {
        UserDefaultsLocalDataStore.shared
    }
}

struct UserDefaultsLocalDataStore: LocalDataStore {

    static var shared = UserDefaultsLocalDataStore()

    var sets: CurrentValueSubject<[TrackedSet], Never> = .init([])

    @AppStorage("tracked_sets")
    private var setsData = Data()

    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()

    private var cancellables = Set<AnyCancellable>()

    init() {
        do {
            sets.value = try decoder.decode([TrackedSet].self, from: setsData)
        } catch {
            print("No data for saved Sets")
        }

        sets
            .receive(on: RunLoop.main)
            .removeDuplicates()
            .encode(encoder: encoder)
            .replaceError(with: Data())
            .assign(to: \.setsData, on: self)
            .store(in: &cancellables)
    }

    func saveTrackedSet(_ set: TrackedSet) {
        var sets = sets.value
        sets.append(set)
        setSavedTrackedSets(sets)
    }

    func setSavedTrackedSets(_ sets: [TrackedSet]) {
        self.sets.value = sets
    }
}
