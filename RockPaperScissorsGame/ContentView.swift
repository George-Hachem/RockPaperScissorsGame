//
//  ContentView.swift
//  RockPaperScissorsGame
//
//  Created by George on 4/21/23.
//

import SwiftUI

struct ContentView: View {
    let opps = ["ROCK":"PAPER", "PAPER":"SCISSORS","SCISSORS": "ROCK"]
    let game = ["ROCK", "PAPER", "SCISSORS"]
    @State private var response = ""
    @State private var showingScore = false
    @State private var computerPick = Int.random(in: 0...2)
    @State private var score = 0
    @State private var round = 1
    var body: some View {
        ZStack{
            RadialGradient(gradient: Gradient(stops: [.init(color: Color(red: 0.2, green: 0.8, blue: 0.9), location: 0.45), .init(color:Color(red:0.2, green: 0.4, blue: 0.4), location: 0.9)]), center: .top, startRadius: 200, endRadius: 500).ignoresSafeArea()
            VStack{
                Spacer()
                Text("RockPaperScissors")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
    
    
                VStack(spacing: 30){
                    VStack{
                        Text("Computer picked \(game[computerPick])").font(.title3)
                        Text("Round: \(round)")
                        
                    }
                    
                    ForEach(0..<3){num in
                        Button{
                            gameDecider(num)
                        }label: {
                            Text(game[num])
                                .font(.title.bold())
                                    .foregroundStyle(.black)
                                    .padding()
                                    .background(.red)
                                    .clipShape(Capsule())
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 50))
                Spacer()
                Spacer()
                Text("Score: \(score)").font(.title.bold())
                    .foregroundStyle(.primary)
                    .padding()
                    .background(.ultraThinMaterial)
                    .clipShape(Capsule())
                Spacer()
                
            }.padding()
        }.alert(response, isPresented: $showingScore){
            Button("Continue", action: Question)
                
        }message:{
            Text("Your Score is \(score)")
        }
    }
    func gameDecider(_ num: Int){
        if opps[game[computerPick]] == game[num]{
            response = "YOU WON"
            score+=1
        }
        else{
            response = "YOU LOST"
        }
        showingScore = true
    }
    func Question(){
        round+=1
        computerPick = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
