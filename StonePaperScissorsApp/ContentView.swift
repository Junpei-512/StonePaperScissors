//
//  ContentView.swift
//  StonePaperScissorsApp
//
//  Created by Murayama Junpei on 2021/07/18.
//

import SwiftUI


struct ContentView: View {

    @State var answerNumber = 0

    var body: some View {
        
        VStack {
            
            if answerNumber == 0 {
                Text("これからじゃんけんをします")
                    .padding(.bottom)
            } else if answerNumber == 1 {
                Image("gu")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text("グー")

            } else if answerNumber == 2 {
                Image("choki")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text("チョキ")

            } else {
                Image("pa")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text("パー")

            }
            
            
            Button(action: {
                
                // 新しいじゃんけんの結果を一時的に格納する変数を設ける
                var newAnswerNumber = 0
                
                // ランダムに結果を出すが、前回の結果と異なる場合のみ採用
                // repeatは繰り返しを意味する
                repeat {
                    // 1,2,3の変数をランダムに算出（乱数）
                    newAnswerNumber = Int.random(in: 1...3)
                    
                    // 前回と同じ結果のときは、再度ランダムに数値を出す
                    // 異なる結果のときは、repeatを抜ける
                } while answerNumber == newAnswerNumber
                
                // 新しいじゃんけんの結果を格納
                answerNumber = newAnswerNumber
            }){
                Text("じゃんけんする！")
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .font(.title)
                    .background(Color.pink)
                    .foregroundColor(Color.white)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
