//
//  ContentView.swift
//  swift-21
//
//  Created by Cam Nelson on 2019-12-07.
//  Copyright © 2019 Cam Nelson. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var userCard1 = 0
    @State private var userCard2 = 0
    @State private var dealerCard1 = 0
    @State private var dealerCard2 = 0
    @State private var userSum = 0
    @State private var dealerSum = 0
    @State private var dealerHitCard = 0
    @State private var userHitCard = 0
    @State private var userHitCount = 0
    @State private var userScore = 0
    @State private var dealerScore = 0
    @State private var stand = false
    @State private var userBust = false // need to deal with this
    @State private var dealerBust = false
    
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                ZStack {
                    HStack {
                        Image("card" + String(dealerCard1))
                        Image("card" + String(dealerCard2))
                    }
                    if (stand && self.dealerSum < 18) {
                        Image("card" + String(self.dealerHitCard))
                            .padding(.bottom)
                    }
                }
                Text(String(self.dealerSum))
                Spacer()
                Button(action: {
                    self.userCard1 = Int.random(in: 2...14)
                    self.userCard2 = Int.random(in: 2...14)
                    self.userSum += (self.userCard1 + self.userCard2)
                    self.dealerCard1 = Int.random(in: 2...14)
                    self.dealerCard2 = Int.random(in: 2...14)
                    self.dealerSum += (self.dealerCard1 + self.dealerCard2)
                }) {
                    Image("dealbutton")
                        .renderingMode(.original)
                }
                Spacer()
                Text((String(self.userSum)))
                ZStack {
                    HStack {
                        Image("card" + String(userCard1))
                            .animation(.easeInOut)
                        Image("card" + String(userCard2))
                            .animation(.easeInOut)
                    }
                    if (self.userHitCard > 0) {
                        Image("card" + String(self.userHitCard))
                            .padding(.top)
                    }
                }
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        self.userHitCard = Int.random(in: 2...14)
                        self.userSum += self.userHitCard
                    }) {
                        Text("Hit")
                            .padding(.all)
                            .foregroundColor(.black)
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                    }
                    Spacer()
                    Button(action: {
                        self.stand = true
                        while(self.dealerSum < 18) {
                            self.dealerHitCard = Int.random(in: 2...14)
                            self.dealerSum += self.dealerHitCard
                            sleep(1)
                        }
                    }) {
                        Text("Stand")
                            .padding(.all)
                            .foregroundColor(.black)
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                    }
                    Spacer()
                }
            }
        }
    }
}

func dealerPlay(dealerScore: Int) -> Int {
    var score = dealerScore
    while (score < 17) {
        score += Int.random(in: 2...14)
    }
    return score
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
