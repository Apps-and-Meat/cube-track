//
//  HistoryViewModel.swift
//  cube-track
//
//  Created by Karl Söderberg on 2022-06-30.
//

import Foundation

class HistoryViewModel: ObservableObject {

    let localDataStore: LocalDataStore = UserDefaultsLocalDataStore.shared

    @Published var history = [TrackedSet]()

    init() {
        UserDefaultsLocalDataStore.shared
            .sets
            .receive(on: RunLoop.main)
            .assign(to: &$history)
    }
}
