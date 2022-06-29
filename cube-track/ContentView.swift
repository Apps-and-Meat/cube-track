//
//  ContentView.swift
//  cube-track
//
//  Created by Karl Söderberg on 2022-06-29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TimeTrackerView()
            .frame(minWidth: 300, minHeight: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
