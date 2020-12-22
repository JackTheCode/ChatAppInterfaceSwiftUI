//
//  ChatModel.swift
//  ChatAppInterfaceSwiftUI
//
//  Created by phatnt on 12/18/20.
//

import Foundation

class ChatModel: ObservableObject {
        
    var text = ""
    @Published var arrayOfMessages: [String] = []
    @Published var arrayOfPositions: [BubblePosition] = []
    @Published var position = BubblePosition.right
    
}
