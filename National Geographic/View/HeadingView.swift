//
//  HeadingView.swift
//  National Geographic
//
//  Created by Mesut Aygün on 4.07.2021.
//

import SwiftUI

struct HeadingView: View {
    
    var headingImage : String
    var headingText : String
    
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }//hstack
        .padding(.vertical)
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wildernes in Pictures")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
