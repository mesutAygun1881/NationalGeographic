//
//  AnimalListItemView.swift
//  National Geographic
//
//  Created by Mesut Aygün on 4.07.2021.
//

import SwiftUI

struct AnimalListItemView: View {
    //MARK ->PROPERTIES
    
    let animal : Animal
    
    //MARK ->BODY
    var body: some View {
        HStack {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        
            VStack(alignment: .leading, spacing: 8) {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(animal.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing , 8)
            }//vstack
        }//hstack
    }
}
    //MARK ->PREVIEW

struct AnimalListItemView_Previews : PreviewProvider {
    
    static let animals : [Animal] =
    Bundle.main.decode("animals.json")

    static var previews: some View {
        AnimalListItemView(animal: animals[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
