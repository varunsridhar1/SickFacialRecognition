//
//  ContentView.swift
//  InstaDocv1.2
//
//  Created by Abhilash Chilakamarthi on 5/14/20.
//  Copyright © 2020 Abhilash Chilakamarthi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var fever = true
    @State private var senses = true
    @State private var SOB = true
    @State private var URI = true
    @State private var c19contact = true
    @State private var statetravel = true
    @State private var countrytravel = true
    @State private var done = false
    @State private var actSheet = false
    @State private var showImagePicker = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var image: UIImage?
    //settings meme - remove for legit demos lol
    @State private var ads = true
    
    var body: some View {
        NavigationView {
            
            List {
                NavigationLink(destination: List {
                    Section(header: Text("Symptomatic Screen")) {
                        HStack {
                            Button(action: {self.fever.toggle()}) {
                                if self.fever {Image(systemName: "circle.fill").foregroundColor(Color.blue)}
                                else {Image(systemName: "circle").foregroundColor(Color.blue)}
                            }
                            Text("Fever greater than 100.4 °F (38.5 °C)?")
                        }
                        HStack {
                            Button(action: {self.senses.toggle()}) {
                                if self.senses {Image(systemName: "circle.fill").foregroundColor(Color.blue)}
                                else {Image(systemName: "circle").foregroundColor(Color.blue)}
                            }
                            Text("Changes/Loss of sense of smell or taste?")
                        }
                        HStack {
                            Button(action: {self.SOB.toggle()}) {
                                if self.SOB {Image(systemName: "circle.fill").foregroundColor(Color.blue)}
                                else {Image(systemName: "circle").foregroundColor(Color.blue)}
                            }
                            Text("Chest pains or shortness of breath?")
                        }
                        HStack {
                            Button(action: {self.URI.toggle()}) {
                                if self.URI {Image(systemName: "circle.fill").foregroundColor(Color.blue)}
                                else {Image(systemName: "circle").foregroundColor(Color.blue)}
                            }
                            Text("Cough or nasal congestion worse than baseline amounts?")
                        }
                    }
                    
                    Section(header: Text("Social/Travel Screen")) {
                        HStack {
                            Button(action: {self.c19contact.toggle()}) {
                                if self.c19contact {Image(systemName: "circle.fill").foregroundColor(Color.blue)}
                                else {Image(systemName: "circle").foregroundColor(Color.blue)}
                            }
                            Text("Contact with any positive COVID-19 individuals?")
                        }
                        HStack {
                            Button(action: {self.statetravel.toggle()}) {
                                if self.statetravel {Image(systemName: "circle.fill").foregroundColor(Color.blue)}
                                else {Image(systemName: "circle").foregroundColor(Color.blue)}
                            }
                            Text("Recent travel outside the state?")
                        }
                        HStack {
                            Button(action: {self.countrytravel.toggle()}) {
                                if self.countrytravel {Image(systemName: "circle.fill").foregroundColor(Color.blue)}
                                else {Image(systemName: "circle").foregroundColor(Color.blue)}
                            }
                            Text("Recent Travel outside the country?")
                        }
                    }
                    
                    Section(header: Text("Assessment")) {
                        HStack {
                            Button(action: {self.done.toggle()}) {
                                if self.done{Image(systemName: "circle.fill").foregroundColor(Color.blue)}
                                else {Image(systemName: "circle").foregroundColor(Color.blue)}
                            }
                            Text("Finished Reporting Answers?")
                        }
                    }
                    
                    
                    //Super Basic Logic for now, probably can fine tune and assigns weights to each questionnaire item later on
                    if !fever && !senses && !SOB && !URI && done{
                        
                        Text("Clear - Proceed to Facial Scan").foregroundColor(Color.green)}
                    
                    if (fever || senses || SOB || URI) && done {
                        Text("At risk for spreading COVID-19").foregroundColor(Color.red)}
                    
                }.navigationBarTitle("Untap as Applicable").foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.3))) { Text("Self Screen Questionnaire").font(.headline).foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.3)) }
                
                
                //FACIAL SCAN TOOL CAMERA STUFF
                //Referenced a lot of guides and online material for this part
                //Uses the ImagePicker.swift
                
                NavigationLink(destination: VStack{
                    Image(uiImage: image ?? UIImage(named: "personicon")!)
                        .resizable()
                        .frame(width: 300, height: 300)
                    
                    Button("Select Image") {
                        self.actSheet = true
                    }.padding()
                        .actionSheet(isPresented: $actSheet) {
                            ActionSheet(title: Text("Choose"), buttons: [
                                .default(Text("Photo Library")) {
                                    self.showImagePicker = true
                                    self.sourceType = .photoLibrary
                                },
                                .default(Text("Camera")) {
                                    self.showImagePicker = true
                                    self.sourceType = .camera
                                },
                                .cancel()
                            ])
                    }
                    Spacer()
                }) { Text("Facial Scan Tool").font(.headline).foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.3))
                    
                }
                
                
                
                NavigationLink(destination: List {
                    //Hard coded some examples for now, later on we can find a way to upload real time results and format it like this
                    Section(header: Text("02/14/2020")) {
                        HStack {
                            Image(systemName: "xmark.shield.fill").foregroundColor(Color.red)
                            Text("Self Screen: Failed")
                        }
                        HStack {
                            Image(systemName: "xmark.shield.fill").foregroundColor(Color.red)
                            Text("Facial Scan: 95% Sick")
                        }
                    }
                    Section(header: Text("04/30/2020")) {
                        HStack {
                            
                            Image(systemName: "checkmark.shield.fill").foregroundColor(Color.green)
                            Text("Self Screen: Passed")
                        }
                        HStack {
                            Image(systemName: "checkmark.shield.fill").foregroundColor(Color.green)
                            Text("Facial Scan: 100% Well")
                        }
                    }
                    
                    
                }.navigationBarTitle(Text("Past Screen Results"))) { Text("Screen History").font(.headline).foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.3)) }
                //IDK what settings to put in tbh but I feel like there should be a settings area
                //left a meme here for now
                NavigationLink(destination: List {
                    Toggle(isOn: $ads) {
                        Text("Ads")
                    }
                    if !ads {
                        Text("Lol, Nice Try")
                    }
                    }
                ) { Text("Settings").font(.headline).foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.3)) }
                NavigationLink(destination: Text("This Application is not intended to replace or be considered Medical Advice. Plese consult your Doctor for Medical Concerns.")
                    .padding([.leading, .bottom, .trailing])) {Text("Disclaimer").font(.headline).foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.3)) }
            }.navigationBarTitle("InstaDoc").foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.3))
            
        }.sheet(isPresented: $showImagePicker) {
            ImagePicker(image: self.$image, isShown: self.$showImagePicker, sourceType: self.sourceType)}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
