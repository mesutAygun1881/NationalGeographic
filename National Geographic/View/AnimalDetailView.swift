//
//  DetailView.swift
//  National Geographic
//
//  Created by Mesut Aygün on 4.07.2021.
//

import SwiftUI
import MapKit

struct AnimalDetailView: View {
    //MARK -> PROPERTIES
    
    let animal : Animal
    
    //MARK -> BODY
    var body: some View {
        ScrollView(.vertical , showsIndicators:  false) {
            VStack(alignment: .center, spacing: 20) {
                
                //HEROIMAGE
                
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                //TITLE
                Text(animal.name)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical , 8)
                    .foregroundColor(.primary)
                    .background(Color.accentColor
                                    .frame(height : 8)
                                    .offset(y:24))
                //HEADLINE
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                //GALLERY
                
                Group{
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wildernes in Pictures")
                    ImageGalleryView(animal: animal)
                }//group
                .padding(.horizontal)
                
                //FACTS
                Group {
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did You Know ?")
                    InsetFactView(animal: animal)
                }.padding(.horizontal)
                
                //DESCRIPTION
                
                Group{
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                }.padding(.horizontal)
                
                //MAP
                Group {
                    HeadingView(headingImage: "map", headingText: "National Parks")
                    NatGeoParksView()
                }.padding(.horizontal)
                
                //LINK
                Group {
                    ExternalWebLinkView(animal: animal)
                }
                
            }//vstack
            .navigationBarTitle("Learn About \(animal.name)",displayMode: .inline)
        }//scroll
    }
}


    //MARK -> PREVIEWS
struct DetailView_Previews: PreviewProvider {
    static let animals : [Animal] =
    Bundle.main.decode("animals.json")
    static var previews: some View {
        NavigationView{
            AnimalDetailView(animal: animals[0])
        }
            .previewDevice("iPhone 11 Pro Max")
    }
}
