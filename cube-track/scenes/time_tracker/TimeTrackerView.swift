//
//  TimeTrackerView.swift
//  cube-track
//
//  Created by Karl Söderberg on 2022-06-29.
//

import SwiftUI
import ShortcutUI
import ShortcutFoundation

struct TimeTrackerView: View {

    @StateObject var vm = TimeTrackerViewModel()

    var body: some View {
        
        VStack {

            VStack {
                ForEach(vm.trackedTimes.indexedArray(), id: \.index) { item in
                    HStack {
                        Text("Lap \(item.index)")
                            .frame(maxWidth: 100, alignment: .leading)
                        Text(item.element.timeScore.durationFormat)
                            .foregroundColor(self.colorFor(time: item.element))
                            .frame(maxWidth: 100, alignment: .trailing)
                    }
                }
            }

            .font(.title2)
            .padding()
            .border(Color.accentColor, width: 2.0)
            .padding(.horizontal)
            .opacity(vm.trackedTimes.isEmpty ? 0 : 1)


            Spacer()

            if vm.trackedSet == nil {
                Text(vm.time.durationFormat)
                    .font(.title)
                    .frame(width: 200)
                    .padding()
                    .border(Color.accentColor, width: 5.0)

                Group {
                    if vm.isTracking {
                        TouchButton(action: vm.endTimer)
                    } else {
                        TouchButton(action: vm.startTimer)
                    }
                }.buttonStyle(TouchButtonStyle())

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

    private func colorFor(time: TrackedTime) -> Color? {
        if vm.trackedTimes.isShortest(time: time) {
            return Color.green
        } else if vm.trackedTimes.isLongest(time: time) {
            return Color.red
        } else {
            return nil
        }
    }

    private struct TouchButton: View {
        var action: () -> Void

        var body: some View {
#if os(macOS)
            osxLabels()
#else
            iosButtons()
#endif

        }

        @ViewBuilder
        private func osxLabels() -> some View {
            HStack {
                Label("Shift", systemImage: "keyboard.fill")
                Text(" + ")
                    .padding()
                    .fixedSize(horizontal: true, vertical: false)
                Label("Space", systemImage: "keyboard.fill")
            }
            .overlay {
                Button(action: action) {
                    Text("")
                }
                .hidden()
                .keyboardShortcut(.space, modifiers: .shift)
            }
            .font(.title)
        }

        @ViewBuilder
        private func iosButtons() -> some View {
            Button("", action: action)
                .buttonStyle(TouchButtonStyle())
        }
    }

    private struct TouchButtonStyle: ButtonStyle {

        func makeBody(configuration: Configuration) -> some View {
            HStack {
                Group {
                    Image(systemName: "hand.raised.circle")
                        .resizable()
                    Image(systemName: "hand.raised.circle")
                        .resizable()
                        .rotation3DEffect(.degrees(180), axis: (0, 1, 0))
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 300)


            }
        }

    }

    private struct TouchView: View {

        var action: () -> Void

        var body: some View {

            HStack {
                Group {

                    //                    Button(action: action) {
                    Image(systemName: "hand.raised.circle")
                        .resizable()
                    Image(systemName: "hand.raised.circle")
                        .resizable()
                        .rotation3DEffect(.degrees(180), axis: (0, 1, 0))
                    //                    }.keyboardShortcut("o", modifiers: .command)


                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 300)
                //                .onTapGesture(perform: action)


            }

        }
    }
}

struct TimeTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        TimeTrackerView()
    }
}
