//
//  ViewControlModel.swift
//  Pompy
//
//  Created by Long Hai on 10/16/22.
//

import Foundation
import SwiftUI

class ViewControlModel: ObservableObject {
    @Published var isShowingLocation = false
    @Published var isShowingEating = false
    @Published var isShowingChat = false
    @Published var isShowingRoadmap = false
    @Published var isShowingTree = false
    @Published var isShowingPompy = false
    @Published var isShowingAnalyze = false
    
    
}
