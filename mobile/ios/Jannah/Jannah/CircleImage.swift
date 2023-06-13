//
//  CircleImage.swift
//  Jannah
//
//  Created by Osman Jalloh on 6/12/23.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Image("OsmanJalloh_Picture_FB2")
            .clipShape(Circle())
            .overlay {
             Circle().stroke(.gray, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
