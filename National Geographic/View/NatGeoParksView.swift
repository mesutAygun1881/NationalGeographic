//
//  NatGeoParksView.swift
//  National Geographic
//
//  Created by Mesut Aygün on 4.07.2021.
//

import SwiftUI
import MapKit

struct NatGeoParksView: View {
    
  @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.75773, longitude: -73.985708), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(
                NavigationLink(destination : MapView()){
                HStack{
                    Image(systemName: "mappin.circle")
                        .foregroundColor(Color.white)
                        .imageScale(.large)
                    Text("Location")
                        .foregroundColor(.accentColor)
                        .fontWeight(.bold)
                }
                .padding(.horizontal , 14)
                .padding(.vertical, 10)
                .background(
                    Color.black.opacity(0.5).cornerRadius(12))
            }.padding(12) , alignment: .topTrailing
            )
            .frame(height : 256)
            .cornerRadius(12)
    }
}

struct NatGeoParksView_Previews: PreviewProvider {
    static var previews: some View {
        NatGeoParksView()
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDevice("iPhone 11 Pro")
    }
}
