//
//  ContentView.swift
//  cube-track
//
//  Created by Karl Söderberg on 2022-06-29.
//

import SwiftUI

struct ContentView: View {
    @StateObject var modalVM = ModalViewModel.shared

    var body: some View {
        TimeTrackerView()
            .frame(minWidth: 300, minHeight: 300)
            .sheet(item: $modalVM.presentedModal) { presentedModal in
                switch presentedModal {
                case .history:
                    HistoryView()
                }
            }
    }
}

class ModalViewModel: ObservableObject {

    static var shared = ModalViewModel()

    @Published var presentedModal: PresentedModal?
}

enum PresentedModal: Identifiable {
    case history

    var id: String {
        switch self {
        case .history: return "history"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
