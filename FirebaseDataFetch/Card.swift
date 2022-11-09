//
//  Card.swift
//  FirebaseDataFetch
//
//  Created by zoya me on 11/9/22.
//

import SwiftUI
import Firebase


struct Card: View {
    
    var cardData: PostModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(maxWidth: .infinity)
                .frame(height: 150)
                .foregroundColor(Color.purple.opacity(0.3))
            
                .overlay {
                    VStack(alignment: .leading) {
                        HStack {
                            Image("goat")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .frame(width: 60, height: 60)
                                .overlay(RoundedRectangle(cornerRadius: 60).strokeBorder(Color.white, style: StrokeStyle(lineWidth: 2)))
                                .offset(x: -5, y: -10)
                           
                            Text(cardData.name)
                                .bold()
                                .font(.custom("PlayfairDisplay-Bold", fixedSize: 30))
                                //.foregroundColor(Color.white)
                                .padding(.all, 5)
                                .offset(y: -15)
                           
                            Spacer()
                            
                        }
                        Text(cardData.user_name)
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(Color.purple)
                            .padding(.top, 10)
                            .offset(y: -20)
                        
                    }.padding(.leading)
                    
                }
            
        }.padding([.leading, .trailing], 10)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(cardData: PostModel(name: "Mark", user_name: "mark_me"))
    }
}

