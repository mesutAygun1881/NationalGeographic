//
//  ImageGalleryView.swift
//  National Geographic
//
//  Created by Mesut Aygün on 4.07.2021.
//

import SwiftUI

struct ImageGalleryView: View {
    
    var animal : Animal
    
    var body: some View {
        ScrollView(.horizontal , showsIndicators: false) {
            
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery , id : \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height : 200)
                        .cornerRadius(12)
                }
        }
        }//Hstack
    }
}

struct ImageGalleryView_Previews: PreviewProvider {
    static let animals : [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        ImageGalleryView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
