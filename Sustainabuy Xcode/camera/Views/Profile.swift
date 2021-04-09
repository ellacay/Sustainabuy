//
//  Profile.swift
//  Sustainabuy
//
//  Created by EllaCaySmith on 29/10/20.
//  Copyright © 2020 EllaCaySmith. All rights reserved.
//

import Foundation
import SwiftUI
struct Profile: View {
    
    @State var slideUp = false
    

    
    var scoreRatingInt = [
        "Fructis": 3,
        "Vaseline": 4,
        "Organic": 1,
        "M&M's": 1,
        "Smarties": 3,
        "Skittles": 2,
        "Maltesers": 1
    
    ]

    @EnvironmentObject var scoreData: ScoreData
    @EnvironmentObject var settings: Data
    @EnvironmentObject var history: History

    
    func userDefaultsRemove() {
        UserDefaults.standard.removeObject(forKey: "SavedData")
       }
    
    func removeRows(at offsets: IndexSet) {
        UserDefaults.standard.removeObject(forKey: "\(offsets)")
    }
    private func delete(with indexSet: IndexSet) {
           indexSet.forEach ({ index in
            history.items.remove(at: index)
            history.save()
            

            
            scoreData.scoreResult -= self.scoreRatingInt["\(settings.classificationLabelObserved)"]!
            
        
            UserDefaults.standard.set(self.scoreData.scoreResult, forKey: "Score")
            
            
            
            
           })}
   
    
    var body: some View {
        VStack{
           
        HStack{
            Spacer()
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
                .foregroundColor(.white)
                Spacer()
            Text("Ella")
                .font(.custom("Courier", size: 30))
                .foregroundColor(.white)
            Text("\(UserDefaults.standard.integer(forKey: "Score"))")
                .font(.custom("Courier", size: 25))
                .foregroundColor(.white)
          Spacer()
            Button("Clear"){
                scoreData.scoreResult = 0
                UserDefaults.standard.set(self.scoreData.scoreResult, forKey: "Score")
            }
            Spacer()
        }.frame(width: 500, height: 70, alignment: .leading)
        .background(Color(red: 0.3686, green: 0.7373, blue: 0.7176))
        
       
        List {
            ForEach(history.items) { item in
                HStack{
                    Text("\(item.product):")

                    Image("\(item.image)").resizable()
                        .frame(width: 70, height: 70, alignment: .center)

                    if item.stars == 1{
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                        Image(systemName: "star")
                        .foregroundColor(Color.yellow)
                        Image(systemName: "star")
                        .foregroundColor(Color.yellow)
                        Image(systemName: "star")
                        .foregroundColor(Color.yellow)
                        Image(systemName: "star")
                        .foregroundColor(Color.yellow)

                    }
                    if item.stars == 2{
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                        Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                        Image(systemName: "star")
                        .foregroundColor(Color.yellow)
                        Image(systemName: "star")
                        .foregroundColor(Color.yellow)
                        Image(systemName: "star")
                        .foregroundColor(Color.yellow)

                    }
                    if item.stars == 3{
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                        Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                        Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                        Image(systemName: "star")
                        .foregroundColor(Color.yellow)
                        Image(systemName: "star")
                        .foregroundColor(Color.yellow)

                    }
                    if item.stars == 4{
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                        Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                        Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                        Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                        Image(systemName: "star")
                        .foregroundColor(Color.yellow)

                    }
                    if item.stars == 5{
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                        Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                        Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                        Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                        Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)

                    }

                    Text("\((item.stars)-1) pts")
                    Button(action:{
                        self.slideUp.toggle()
                        
                        if item.product == "M&M's"{
                            self.settings.classificationLabelObserved = "M&M's"
                        }
                        if item.product == "Smarties"{
                            self.settings.classificationLabelObserved = "Smarties"
                        }
                        if item.product == "Organice"{
                            self.settings.classificationLabelObserved = "Organic"
                            
                        }
                        
                        if item.product == "Fructis"{
                            self.settings.classificationLabelObserved = "Fructis"
                            
                        }
                        if item.product == "Vaseline"{
                            self.settings.classificationLabelObserved = "Vaseline"
                        }
                    } ){
                        
                        Image(systemName:"arrow.right.fill")
                    }     .sheet(isPresented: $slideUp){
                        MainInfo()}
                    
            


                }
                
           
            }
            .onDelete(perform: delete)


        }
        }
        
    }


    }


struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
