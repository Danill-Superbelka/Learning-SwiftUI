//
//  ContentView.swift
//  Insatfilter
//
//  Created by Даниил  on 12.08.2021.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color.secondary)
                    
                    if image != nil {
                        image?
                            .resizable()
                            .scaledToFit()
                    } else {
                        Text("Tap to select a picture")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                }
                .onTapGesture {
                    // select an image
                }
                
                HStack{
                    Text("Intensity")
                    Slider(value: self.$filterIntensity)
                }.padding(.vertical)
                
                HStack{
                    Button("Chage Filter") {
                        // chage filter
                    }
                    
                    Spacer()
                    
                    Button("Save") {
                        // save the picture
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationBarTitle("Instafilter")
        }
            
        }
    }
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
