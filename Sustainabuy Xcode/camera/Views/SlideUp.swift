//
//  SlideUp.swift
//  Sustainabuy
//
//  Created by EllaCaySmith on 29/10/20.
//  Copyright © 2020 EllaCaySmith. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
struct SlideUpView: View{
    
    @State private var score = UserDefaults.standard.integer(forKey: "Score")
//    @ObservedObject var data = Data()
    @EnvironmentObject var settings: Data
    @EnvironmentObject var scoreData: ScoreData
    @EnvironmentObject var history: History
    
    // the label variable has been sent from the calendar view
    @State var label = ""
//    @State var score = 0

    var starRatingInt = [
        "Fructis": 4,
        "Vaseline": 5,
        "Organic": 2,
        "M&M's": 2,
        "Smarties": 4,
        "Skittles": 3,
        "Maltesers": 2
    
    ]


    
    var scoreRatingInt = [
        "Fructis": 3,
        "Vaseline": 4,
        "Organic": 1,
        "M&M's": 1,
        "Smarties": 3,
        "Skittles": 2,
        "Maltesers": 1
    
    ]

@State var photo: Image? = nil
        @State private var showingSheet = false
    var body: some View{
        NavigationView{
        
             
            VStack(alignment:.leading){
            
             Spacer()
            HStack(spacing:40.0){
               
                VStack(spacing:10){
                    Text("\(settings.classificationLabelObserved)")
                 
                .font(.custom("Courier", size: 25))
                
                  

                    HStack{
                        
                        // this has a set
                        if settings.classificationLabelObserved == "Fructis"{
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
                        if settings.classificationLabelObserved == "Vaseline"{
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
                    
                        if settings.classificationLabelObserved == "Organic"{
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
                        
                        if settings.classificationLabelObserved == "Smarties"{
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
                        
                        if settings.classificationLabelObserved == "M&M's"{
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
                        
                        if settings.classificationLabelObserved == "Maltesers"{
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
                }
                   
                    Button("More Information"){
                        self.showingSheet.toggle()
                                   
                    }.sheet(isPresented: $showingSheet){
                        MainInfo()
                    }
                        .foregroundColor(Color.white)
                }
               
                Image("\(settings.classificationLabelObserved)")
                .resizable()
                                      .scaledToFit()
                                          
                                        
                                      .cornerRadius(25)
                                      .overlay(RoundedRectangle(cornerRadius: 25)
                                      .stroke(Color(red: 0.302, green: 0.6078, blue: 0.5412), lineWidth: 3), alignment: .center)
                                        .frame(width: 100, height: 100, alignment: .leading)
               
                Button(action: {
                    let history = HistoryItem(product: self.settings.classificationLabelObserved, stars: self.starRatingInt["\(settings.classificationLabelObserved)"]!, image: self.settings.classificationLabelObserved)
                    
                                  self.history.items.append(history)
                      
                        self.history.save()
                
                    
                    self.scoreData.scoreResult += self.scoreRatingInt["\(settings.classificationLabelObserved)"]!
                    UserDefaults.standard.set(self.scoreData.scoreResult, forKey: "Score")
                           }) {
                  Image(systemName: "cart")
                }
                
                
               
            }.frame(width: 450, height: 130, alignment: .center)
            .background(Color(red: 0.3686, green: 0.7373, blue: 0.7176))
             .cornerRadius(40)
           
          
            
        }.background(Color.white)
            .navigationBarTitle("Barcode Scanner")
           
        }
            
        
         
    }
}
class ScoreData :ObservableObject{
    @Published var scoreResult = 0

}



struct SlideUp_Previews: PreviewProvider {
    static var previews: some View {
        SlideUpView().environmentObject(Data())
    }
}
