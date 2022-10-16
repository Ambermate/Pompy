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
                    Text("Hi")
                }
                recordButton()
                    .padding(.bottom, 30)
            }
        }
        .onAppear {
            speechManager.checkPermissions()
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
        Button(action: { Transcribing() }) {
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
