//
//  HistoryView.swift
//  cube-track
//
//  Created by Karl Söderberg on 2022-06-30.
//

import SwiftUI

struct HistoryView: View {

    @StateObject var vm = HistoryViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(vm.history) { trackedSet in
                HStack {
                    Text(trackedSet.startDate.formatted())
                        .frame(maxWidth: .infinity)
                    Text(trackedSet.medianTime.durationFormat)
                }
            }
        }.frame(width: 300, height: 300)
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
