//
//  SwiftUIView.swift
//  Pompy
//
//  Created by Long Hai on 10/16/22.
//

import SwiftUI
import CoreData

struct Chat: View {
    @Environment(\.managedObjectContext) private var viewContext
    //@FetchRequest(sortDescriptors: [NSSortDescriptor(keypath: \Todo.created)])
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var controlModel: ViewControlModel
    @State private var recording = false
    @ObservedObject private var mic = MicManager(numberOfSamples: 30)
    private var speechManager = SpeechManager()
    
    
    var body: some View {
        ZStack {
            VStack {
                Image("bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea(.all)
            }
            
            VStack {
                Spacer().frame(height: 100)
                GifImage("fluffy")
                
            }
            
            VStack {
                Spacer()
                if viewModel.Dialog != "" {
                    Text(viewModel.Dialog)
                } else {
                    Text("Hi, I'm Pompy")
                }
                recordButton()
                    .padding(.bottom, 30)
            }
            
            VStack {
                Button(action: {controlModel.isShowingChat = false}) {
                    Image(systemName: "xmark")
                        .font(.system(size: 40))
                        .padding(.horizontal, 3)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(.leading, 10)
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
                .cornerRadius(20)
                .tint(.black.opacity(1))
                .padding()
                .padding(.top, 10)
            }
        }
        .onAppear {
            speechManager.checkPermissions()
            playSound(sound: "hello", type: "mp3")
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
//                audioPlayer = nil
//            }
           //playSound(sound: "bonjour", type: "mp3")
        }
        
    }
    private func Transcribing() {
        if speechManager.isRecording {
            self.recording = false
            mic.stopMonitoring()
            speechManager.stopRecording()
        } else {
            self.recording = true
            mic.startMonitoring()
            speechManager.start { (speechText) in
                guard let text = speechText, !text.isEmpty else {
                    self.recording = false
                    return
                }
                viewModel.Dialog = text
                
            }
        }
        speechManager.isRecording.toggle()
    }
    private func recordButton() -> some View {
        Button(action: {
            Transcribing()
            audioPlayer?.stop()
        }) {
            Image(systemName: recording ? "stop.fill" : "mic.fill")
                .font(.system(size: 40))
                .padding()
                .cornerRadius(10)
            
        }
        .foregroundColor(.red)
    }
}

struct Chat_Previews: PreviewProvider {
    static var previews: some View {
        Chat().environmentObject(ViewModel())
    }
}
