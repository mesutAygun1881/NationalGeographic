//
//  VideoListViewer.swift
//  National Geographic
//
//  Created by Mesut Aygün on 4.07.2021.
//

import SwiftUI

struct VideoListViewer: View {
    @State var videos : [Video] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    NavigationLink(destination : VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                        VideoListItem(video: item)
                            .padding(.vertical , 8)
                    }
                }//loop
            }//list
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos" , displayMode: .inline)
            .toolbar {
                ToolbarItem(placement : .navigationBarTrailing) {
                    Button(action : {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }) {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
            
            
        }//nav
    }
}

struct VideoListViewer_Previews: PreviewProvider {
    static var previews: some View {
        VideoListViewer()
    }
}
