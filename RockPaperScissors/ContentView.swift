//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Mohamed Obaya on 28/04/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var computerChoice: Int = Int.random(in: 0...2)
    @State private var playerChoice: Int = 0
    @State private var shouldWin: Bool = Bool.random()
    @State private var score: Int = 0
    @State private var round: Int = 1
    @State private var showRoundAlert: Bool = false
    @State private var showGameOver: Bool = false
    private var maxRound: Int = 10
    
    private var checkWin: Bool {
        switch playerChoice {
        case 0: // player choice is rock
            computerChoice == 2 // true, if computer choice is scissors
            
        case 1: // player choice is paper
            computerChoice == 0 // true, if computer choice is rock
            
        case 2: // player choice is scissors
            computerChoice == 1 // true, if computer choice is paper
            
        default:
            false
        }
    }
    
    private var shouldWinText: String {
        if shouldWin {
            "\(checkWin ? "Correct": "Wrong")"
        } else {
            "\(checkWin ? "Wrong": "Correct")"
        }
    }
    
    var body: some View {
        ZStack {
            backGroundColor
            
            VStack {
                
                Spacer()
                Text("Round \(round)")
                    .titleStyle()
                
                Spacer()
                
                Text("Score → \(score)")
                    .titleStyle()
                
                Spacer()
                
                Text(gameItems[computerChoice])
                    .computerChoiceStyle()
                
                HStack {
                    Text("Play to")
                    Text("\(shouldWin ? "win": "lose")")
                        .foregroundStyle(shouldWin ? .green: .red)
                        .fontWeight(.semibold)
                    Text("!")
                }
                .font(.title)
                .foregroundStyle(.ultraThickMaterial)
                
                Spacer()
                Spacer()
                
                HStack {
                    ForEach(gameItems, id: \.self) { choice in
                        Button(action: {
                            playerChoice = gameItems.firstIndex(of: choice) ?? 0
                            checkAnswer()
                            
                            if round < maxRound {
                                showRoundAlert = true
                            } else {
                                showGameOver = true
                            }
                            
                        }) {
                            Text(choice)
                        }
                        .choiceButtonStyle()
                        .alert("Round \(round)", isPresented: $showRoundAlert) {
                            Button("Restart", action: reset)
                            Button("Continue", action: toNextRound)
                        } message: {
                            Text("\(shouldWinText), Your score now is \(score)")
                        }
                        .alert("Game Over", isPresented: $showGameOver) {
                            Button("Restart", action: reset)
                        } message: {
                            Text("Your total score is \(score) in \(round) rounds")
                        }
                        
                    }
                }
            }
        }
    }
    
    func checkAnswer() {
        if shouldWin && checkWin {
            score += 1
        } else if !shouldWin && !checkWin{
            score += 1
        } else {
            score -= 1
        }
    }
    
    func toNextRound() {
        round += 1
        computerChoice = Int.random(in: 0...2)
        shouldWin.toggle()
    }
    
    func reset() {
        computerChoice = Int.random(in: 0...2)
        playerChoice = 0
        shouldWin = Bool.random()
        score = 0
        round = 1
    }
    
}

#Preview {
    ContentView()
}
