//
//  ContentView.swift
//  CO-Voice
//
//  Created by Mohammad Yasir on 13/02/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var vm = VoiceViewModel()
    
    @State private var showingList = false
    @State private var showingAlert = false
    
    @State private var effect1 = false
    @State private var effect2 = false

    
    var body: some View {
        
        ZStack{
            
            Image("back")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                
            
            VStack{
                HStack{
                    Button(action: {
                        showingAlert = true
                    }) {
                        Image(systemName: "info.circle.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold))
                    }.alert(isPresented: $showingAlert) {
                        Alert(title: Text("Hi There !"), message: Text("Use CO-Voice to Learn the code and Implementations . Enjoy the Code and ask me anything on my socials media"), dismissButton: .default(Text("Got it")))
                    }
                    
                    Spacer()
                    
                    Text("CO-Voice")
                        .foregroundColor(.white)
                        .font(.system(size: 20 , weight : .bold))
                    
                    Spacer()
                    
                    Button(action: {
                        if vm.isRecording == true {
                            vm.stopRecording()
                        }
                        vm.fetchAllRecording()
                        showingList.toggle()
                    }) {
                        Image(systemName: "list.bullet")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold))
                    }.sheet(isPresented: $showingList, content: {
                        recordingListView()
                    })
                    
                }
                
                Spacer()
                
                if vm.isRecording {
                    
                    VStack(alignment : .leading , spacing : -5){
                        HStack (spacing : 3) {
                            Image(systemName: vm.isRecording && vm.toggleColor ? "circle.fill" : "circle")
                                .font(.system(size:10))
                                .foregroundColor(.red)
                            Text("Rec")
                        }
                        Text(vm.timer)
                            .font(.system(size:60))
                            .foregroundColor(.white)
                    }
                    
                } else {
                    VStack{
                        Text("Press the Recording Button below")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        Text("and Stop when its done")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }.frame(width: 300, height: 100, alignment: .center)
                    
                    
                }
                
                Spacer()
                Spacer()
                
                ZStack {
                    
                    Circle()
                        .frame(width: 70, height: 70)
                        .foregroundColor(Color(#colorLiteral(red: 0.4157493109, green: 0.8572631, blue: 0.9686274529, alpha: 0.4940355314)))
                        .scaleEffect(effect2 ? 1 : 0.8)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true).speed(1))
                        .onAppear(){
                            self.effect2.toggle()
                        }
                    
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                        .scaleEffect(effect2 ? 1 : 1.5)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true).speed(2))
                        .onAppear(){
                            self.effect1.toggle()
                        }
                    
                    
                    Image(systemName: vm.isRecording ? "stop.circle.fill" : "mic.circle.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 45))
                        .onTapGesture {
                            if vm.isRecording == true {
                                vm.stopRecording()
                            } else {
                                vm.startRecording()
                                
                            }
                        }
                    
                }
                
                
                
                Spacer()
                
            }
            .padding(.leading,25)
            .padding(.trailing,25)
            .padding(.top , 70)
            
            Circle()
                .frame(width: 230, height: 230)
                .foregroundColor(Color(#colorLiteral(red: 0.4157493109, green: 0.8572631, blue: 0.9686274529, alpha: 0.4940355314)))
                .scaleEffect(effect2 ? 1 : 0.8)
                .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true).speed(0.5))
                .offset(x: 160, y: 400)
            
            Circle()
                .frame(width: 230, height: 230)
                .foregroundColor(Color(#colorLiteral(red: 0.4157493109, green: 0.8572631, blue: 0.9686274529, alpha: 0.4940355314)))
                .scaleEffect(effect2 ? 1 : 0.8)
                .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true).speed(1))
                .offset(x: 110, y: 400)
            
            
        }
   
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
