//
//  MenuView.swift
//  cube-track
//
//  Created by Karl Söderberg on 2022-07-01.
//

import SwiftUI

struct MenuView: View {
    var body: some View {

        List {

            NavigationLink(destination: TimeTrackerView.init) {
                Text("Tracker")
            }

            NavigationLink(destination: HistoryView.init) {
                Text("History")
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
