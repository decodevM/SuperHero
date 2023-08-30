//
//  SuperHeroView.swift
//  SuperHero
//
//  Created by Inconnu on 8/29/23.
//

import SwiftUI

struct SuperHeroView: View {
    let superHero: SuperHeroModel
    
    @State var isPresented: Bool = false
    @State var isScalingImage: Bool = false
    @State var isSlidingBody: Bool = false
    // This is to enable vibration feedback
    var hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    
    var body: some View {
        ZStack(alignment: .center){
            Image(superHero.image)
                .resizable()
                .scaledToFill()
                .scaleEffect(isScalingImage ? 1 : 0.7)
                .animation(.easeInOut(duration: 0.8), value: isScalingImage)
            VStack{
                Text(superHero.title)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                Button{
                    // Activate the alert
                    isPresented.toggle()
                    // send a vibration to the device
                    hapticImpact.impactOccurred()
                    playSound(sound: "chimeup", type: "mp3")
                }label: {
                    HStack{
                        Text("More")
                        Image(systemName: "chevron.right.circle")
                    }
                }.padding()
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(LinearGradient(colors: superHero.gradientColors, startPoint: .bottomTrailing, endPoint: .topTrailing))
                    .clipShape(Capsule())
                    .alert(isPresented: $isPresented){
                        Alert(title: Text(superHero.title),message: Text(superHero.message),dismissButton: .cancel())
                        
                        
                    }
            }.offset(y: isSlidingBody ? 150 : 400)
                .animation(.easeInOut(duration: 0.8), value: isSlidingBody)
            
        }
        .frame(width: 350,height: 600)
        .background(LinearGradient(gradient: Gradient(colors: superHero.gradientColors), startPoint: .topTrailing, endPoint: .bottomTrailing))
        .cornerRadius(20)
        .onAppear{
            isScalingImage = true
            isSlidingBody = true
        }
    }
}

struct SuperHeroView_Previews: PreviewProvider {
    static var previews: some View {
        SuperHeroView(superHero: superHeros[0])
    }
}
