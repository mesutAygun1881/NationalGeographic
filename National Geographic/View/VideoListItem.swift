//
//  VideoListItem.swift
//  National Geographic
//
//  Created by Mesut Aygün on 4.07.2021.
//

import SwiftUI

struct VideoListItem: View {
    
    let video : Video
    
    var body: some View {
        HStack {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height : 80)
                    .cornerRadius(9)
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height : 32)
                    .shadow(radius: 4)
            }//zstack
            VStack(alignment: .leading, spacing: 10) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
        }//hstack
    }
}

struct VideoListItem_Previews: PreviewProvider {
    static let videos : [Video] = Bundle.main.decode("videos.json")
    static var previews: some View {
        VideoListItem(video: videos[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
