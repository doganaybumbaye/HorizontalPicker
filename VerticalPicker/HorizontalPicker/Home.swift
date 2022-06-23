//
//  Home.swift
//  VerticalPicker
//
//  Created by Doğanay Şahin on 24.06.2022.
//

import SwiftUI

struct Home: View {
    let images = ["homekit", "pencil", "calendar", "checkmark","star"]
    var body: some View {
        ContentView(data: images)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
