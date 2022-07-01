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
                MenuButton(title: "Time tracker", systemImageName: "timer")
            }


            NavigationLink(destination: HistoryView.init) {
                MenuButton(title: "History", systemImageName: "list.star")
            }

        }
    }
}

private struct MenuButton: View {
    let title: String
    let systemImageName: String

    var body: some View {
        
        HStack {

            Image(systemName: systemImageName)

            Text(title)
        }
        .padding(.vertical)
        .font(.title)

    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
