//
//  ContentView.swift
//  tca-university-swiftui
//
//  Created by Alexander Lezya on 12.01.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainView(store: .init(initialState: .init(), reducer: MainFeature()))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
