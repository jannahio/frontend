//
//  ContentView.swift
//  Jannah
//
//  Created by Osman Jalloh on 6/9/23.
//

import SwiftUI
struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)


            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)


            VStack(alignment: .leading) {
                Text("Jannah Operator")
                    .font(.title)


                HStack {
                    Text("Jalloh Labs")
                        .font(.subheadline)
                    Spacer()
                    Text("Oakland,CA")
                        .font(.subheadline)
                }
            }
            Divider()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        CircleImage()
//        MapView()
    }
}

