//
//  TimeTrackerView.swift
//  cube-track
//
//  Created by Karl Söderberg on 2022-06-29.
//

import SwiftUI

struct TimeTrackerView: View {

    @StateObject var vm = TimeTrackerViewModel()

    var body: some View {
        
        VStack {

            HStack {
                Spacer()
                Button("History", action: vm.openHistory)
            }

            Spacer()

            VStack {
                ForEach(vm.trackedTimes) {
                    Text($0.timeScore.durationFormat)
                }
            }
            .frame(width: 100)
            .padding()
            .border(Color.accentColor, width: 2.0)

            if vm.trackedSet == nil {
                Text(vm.time.durationFormat)
                    .font(.title)
                    .frame(width: 200)
                    .padding()
                    .border(Color.accentColor, width: 5.0)

                if vm.isTracking {
                    Button(action: vm.endTimer) {
                        Text("END")
                    }
                } else {
                    Button(action: vm.startTimer) {
                        Text("START")
                    }
                }
            } else {
                HStack {
                    Button(action: vm.saveResults) {
                        Text("Save results")
                    }
                    Button(action: vm.discardResults) {
                        Text("Discard results")
                    }
                }
            }

        }.padding(.bottom)
    }
}

struct TimeTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        TimeTrackerView()
    }
}
