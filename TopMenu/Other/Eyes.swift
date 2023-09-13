//
//  Eyes.swift
//  TopMenu
//
//  Created by Axel Ancona Esselmann on 9/13/23.
//

import SwiftUI

struct Eyes: View {

    let count: Int
    let blinking: Bool

    var body: some View {
        HStack {
            let systemName = blinking ? "eyebrow" : "eye.fill"
            ForEach(0..<count, id: \.self) { index in
                let isOdd = index % 2 == 1
                Image(systemName: systemName)
                    .scaleEffect(x: isOdd ? -1 : 1, y: 1)
                    .frame(width: 20)
                    .padding(.trailing, isOdd ? 24 : 8)
            }
        }.padding(.leading, 24)
    }
}

struct Eyes_Previews: PreviewProvider {
    static var previews: some View {
        Eyes(count: 2, blinking: true)
    }
}
