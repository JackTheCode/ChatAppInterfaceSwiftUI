//
//  Chat.swift
//  ChatAppInterfaceSwiftUI
//
//  Created by phatnt on 12/18/20.
//

import SwiftUI

struct Chat: View {
    
    @ObservedObject var model = ChatModel()
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                CustomScrollView(scrollToEnd: true) {
                    LazyVStack {
                        ForEach(0..<model.arrayOfMessages.count, id:\.self) { index in
                            ChatBubble(position: model.arrayOfPositions[index], color: model.arrayOfPositions[index] == BubblePosition.right ? .green : .blue) {
                                Text(model.arrayOfMessages[index])
                            }
                        }
                    }
                }
                .padding(.top)
                HStack {
                    ZStack {
                        TextEditor(text: $model.text)
                        RoundedRectangle(cornerRadius: 10)
                            .stroke()
                            .foregroundColor(.gray)
                    }.frame(height: 40)
                    Button("Send") {
                        if model.text != "" {
                            model.position = model.position == BubblePosition.right ?  BubblePosition.left : BubblePosition.right
                            model.arrayOfPositions.append(model.position)
                            model.arrayOfMessages.append(model.text)
                            model.text = ""
                        }
                    }
                }
                
            }.padding()
        }
    }
    
}
