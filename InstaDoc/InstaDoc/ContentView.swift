//
//  ContentView.swift
//  InstaDoc
//
//  Created by Abhilash Chilakamarthi on 5/12/20.
//  Copyright © 2020 Abhilash Chilakamarthi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        VStack (spacing: 0){
            Text("InstaDoc")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.363))
                .multilineTextAlignment(.center)

            NavigationView {

                List {
                    NavigationLink(destination: Text("test")) { Text("Self Screen Questionnaire").font(.headline).foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.363)) }
                    NavigationLink(destination: Text("test")) { Text("Facial Scan Tool").font(.headline).foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.363)) }
                    NavigationLink(destination: Text("test")) { Text("Screen History").font(.headline).foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.363)) }
                    NavigationLink(destination: Text("test")) { Text("Settings").font(.headline).foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.363)) }
                    NavigationLink(destination: Text("test")) { Text("About").font(.headline).foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.363)) }
                }
                
            }

        }
    }
        
        
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
