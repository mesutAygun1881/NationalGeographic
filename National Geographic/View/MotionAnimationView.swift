//
//  MotionAnimationView.swift
//  National Geographic
//
//  Created by Mesut Aygün on 6.07.2021.
//

import SwiftUI

struct MotionAnimationView: View {
    //MARK -> PROPERTIES
    @State private var randomCircle = Int.random(in : 12...16)
    @State private var isAnimated : Bool = false
    
    //MARK -> FUNCTIONS
                //random coordinate
    func randomCoordinate(max : CGFloat) -> CGFloat {
        return CGFloat.random(in : 0...max)
    }
                //random size
    func randomSize()->CGFloat{
        return CGFloat(Int.random(in: 10...300))
    }
    
                //random scale
    func randomScale() -> CGFloat{
        return CGFloat(Double.random(in: 0.1...2.0))
    }
                //random speed
    
     func randomSpeed() -> Double{
        return Double.random(in: 0.025...1.0)
    }
                //random delay
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    //MARK -> BODY
    var body: some View {
        GeometryReader { geometry in
            ZStack {
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundColor(.accentColor)
                    .opacity(0.1)
                    .frame(width: randomSize(), height: randomSize(), alignment: .center)
                    .scaleEffect(isAnimated ? randomScale() : 1)
                    .position(x: randomCoordinate(max: geometry.size.width), y: randomCoordinate(max: geometry.size.height)
                    )//position
                    .animation(
                        Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                    ).onAppear(perform:  {
                        isAnimated = true
                    })
            }//loop
            
                
            }//zstack
            .drawingGroup()
        }//geo
    }
}


    //MARK -> PREVIEW
struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
