//
//  MainInfo.swift
//  Sustainabuy
//
//  Created by EllaCaySmith on 29/10/20.
//  Copyright © 2020 EllaCaySmith. All rights reserved.
//

import Foundation
import SwiftUI

struct MainInfo: View {
   
// this is the data available to be displayed

    @ObservedObject var data = Data()
    @EnvironmentObject var settings: Data
    
    @State var similarViewIsShowing = false
    
    var carbonRating  = [
        "Fructis": "2/10",
        "Vaseline": "8/10",
        "Organic": "7/10",
        "Sukin": "7/10",
        "M&M's": "6/10",
        "Smarties": "8/10",
        "Skittles": "7.5/10",
        "Maltesers": "8/10"
    ]
    

//    var Fructis = [
//        "carbonRating": "2/10",
//        "recyclibilityRating":"6/10"]
    
    var recyclibilityRating = [
        "Fructis": "6/10",
        "Vaseline": "3/10",
        "Organic": "6/10",
        "Sukin": "5/10",
    
        "M&M's": "5/10",
        "Smarties": "9/10",
        "Skittles": "6/10",
        "Maltesers": "9/10"
    ]
    
    var productionRating = [
    "Fructis":"8/10",
    "Vaseline": "1/10",
    "Organic":  "9/10",
        "Sukin": "9/10",
        "M&M's": "5.5/10",
        "Smarties": "8.5/10",
        "Skittles": "7/10",
        "Maltesers": "8/10"
        
    ]
    
    var productDescription = [
        "Fructis":"Whether you shampoo frequently, want a conditioner for fine to frizzy hair, or need a leave-in treatment to repair damage, Fructis helps you to customise a routine for your hair type.",
        "Vaseline":"Vaseline Intensive Care Body Lotion Aloe Soothe 750ml, restores the appearance of dry skin. Vaseline Aloe Soothe Lotion soothes and restores the appearance of dry skin. We believe healthy skin starts with deep moisture*",
        "Organic":"OC Naturals environmentally friendly personal care products are made from high performing plant-derived ingredients in recycled and recyclable eco-friendly packaging. Pure and simple, OC Naturals is as kind to your body as it is to the planet..",
        "Sukin": "",
        "M&M's": "M&M’s — made by Mars — have a thin, crisp coating that easily melts away to nothing. It adds more texture than flavor to the overall effect.M&M’s, was much more convoluted on their website about their climate goals. Their packaging is not recyclable ",
        "Smarties": "Smarties — made by Nestlé — have a much thicker exterior with a more noticeable flavor, like the crunchy sugar on Jordan almonds. Smarties manufacturer Nestle has committed to 100% ethically and sustainably sourced cocoa and the packaging is very recyclable.",
        "Skittles": "Skittles is a brand of fruit-flavored candy, currently produced and marketed by the Wrigley Company, a division of Mars, Inc. Skittles consist of hard sugar shells imprinted with the letter ",
        "Maltesers": "Maltesers are a British confectionery product manufactured by Mars, Incorporated. First sold in the UK in 1937, they were originally aimed at women. They have since been sold in Ireland, Australia, New Zealand, Canada, and, since 2017, the US."
        
    ]
    
    var starRating  = [
        "Fructis": "4 stars",
        "Vaseline": "5 stars",
        "Organic":"2 stars",
        "M&M's": "2 stars",
        "Smarties": "4 stars",
        "Skittles": "3 stars",
        "Maltesers": "2 stars"
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

    
    var similar1 = [
        "Fructis":"Organic",
        "Vaseline":"Fructis",
        "Organic":"Sukin",
        "M&M's": "Smarties",
        "Smarties": "M&M's",
        "Skittles": "M&M's",
        "Maltesers": "M&M's"
    
    ]
    
      var similar2 = [
                 "Fructis":"Vaseline",
                 "Vaseline":"Organic",
                 "Organic":"Fructis",
        "M&M's": "Maltesers",
        "Smarties": "Skittles",
        "Skittles": "Maltesers",
        "Maltesers": "Skittles"
      
      ]
    
    
    var similar3 = [
                 "Fructis":"Sukin",
                 "Vaseline":"Fructis",
                 "Organic":"Vaseline",
        "M&M's": "Skittles",
        "Smarties": "Maltesers",
    "Skittles": "Smarties",
    "Maltesers": "Smarties"
    ]
    
   


       var body: some View {
    
        
            // this is the main screen display with the information on it
            ZStack{
            
                VStack{
                    HStack(spacing:5.0){
                        // this uses the variable sent from the slideup view and it corresponds to the image name and thus displays the image that was chosen.
                        Image("\(settings.classificationLabelObserved)")

                    .resizable()
                    .scaledToFit()
                    .cornerRadius(25)
                    .overlay(RoundedRectangle(cornerRadius: 25)
                    .stroke(Color(red: 0.302, green: 0.6078, blue: 0.5412), lineWidth: 3), alignment: .center)
                      .frame(width: 130, height: 130, alignment: .leading)
                          
                        
                        
                VStack{
                    //
                    Text("\(settings.classificationLabelObserved)")
                        
                        .fontWeight(.semibold)
                        .foregroundColor(Color.green)
                        .multilineTextAlignment(.center)
                      .font(.custom("Courier", size: 40))
                    Image(("\(starRating["\(settings.classificationLabelObserved)"]!)"))
                      
                    }}  .frame(width: 450, height: 150, alignment: .center)
                        
                       
                  
                        .background(Color.white)
                    
                    Spacer()
                    VStack{
                        Text("SUSTAINABILITY:")
                            // uses custom fonts
                             .font(.custom("Courier", size: 30))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                    
                        //Uses interpolation to chose the correct key in the arrays. The variable is currently set but a glitch to use the classificationLabel that was sent from slideUp view is in the works
                            Text(("\(productDescription["\(settings.classificationLabelObserved)"]!)")) .foregroundColor(Color.white)
                                                            .multilineTextAlignment(.center)
                                                               .frame(width: 350.0)
                            
                        
                           

                            VStack{
                            HStack{
                                  Image(systemName: "lightbulb.fill")
                                    .resizable()
                                    .padding(1.0)
                                    .scaledToFit()
                                .frame(width: 50
                                    , height: 50, alignment: .center)
                
                            VStack{
                                Text("Carbon Footprint")
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                    .frame(width:   140
                                    , height: 50, alignment: .center)
                                
                                 Text(("\(carbonRating["\(settings.classificationLabelObserved)"]!)"))
                            
                            }
                                }
                            HStack{
                            Image(systemName: "leaf.arrow.circlepath")
                                    .resizable()
                                .padding(1.0)
                                .scaledToFit()
                                    .frame(width: 50, height: 50, alignment: .center)
                            VStack{
                                Text("Recyclability")
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                .frame(width:140, height: 50, alignment: .center)
                                Text(("\(recyclibilityRating["\(settings.classificationLabelObserved)"]!)"))
                                                           }
                                                           }
                                HStack{ Image(systemName: "hammer.fill")
                                    .resizable()
                                    .padding(1.0)
                                    .scaledToFit()
                                    .frame(width: 50, height: 50, alignment: .center)
                                    
                                VStack(alignment: .center){
                                    Text("Production")
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.center)
                                    .frame(width:   140, height: 50, alignment: .center)
                                    Text(("\(productionRating["\(settings.classificationLabelObserved)"]!)"))
                                    }
                                }}
                            }.foregroundColor(.white)
                            .padding()
                                .overlay(RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 5), alignment: .center)
                       
                                
                
                        
                    
                    Spacer()
                    VStack(spacing:0){
                     Text("Similar")
                        .font(.custom("Courier", size: 30))
                        .fontWeight(.semibold)
                         .foregroundColor(Color.green)
                         .multilineTextAlignment(.center)
                        HStack{
                           Spacer()
                            Button(action: {

                                self.settings.classificationLabelObserved = self.similar1["\(settings.classificationLabelObserved)"]!
                            }) {
                                Image(("\(similar1["\(settings.classificationLabelObserved)"]!)"))
                                        .resizable()
                                             .scaledToFit()
                                               .cornerRadius(25)
                                              .frame(width: 100, height: 100, alignment: .leading)
                                               .overlay(RoundedRectangle(cornerRadius: 25)
                                                 .stroke(Color(red: 0.302, green: 0.6078, blue: 0.5412), lineWidth: 3), alignment: .center)
                            }
                                                      Spacer()
                            Button(action: {
                           
                                self.settings.classificationLabelObserved = self.similar2["\(settings.classificationLabelObserved)"]!
                            }) {
                                Image(("\(similar2["\(settings.classificationLabelObserved)"]!)"))
                                        .resizable()
                                             .scaledToFit()
                                               .cornerRadius(25)
                                              .frame(width: 100, height: 100, alignment: .leading)
                                               .overlay(RoundedRectangle(cornerRadius: 25)
                                                 .stroke(Color(red: 0.302, green: 0.6078, blue: 0.5412), lineWidth: 3), alignment: .center)
                            }
                            Spacer()
                            Button(action: {
                               
                                self.settings.classificationLabelObserved = self.similar3["\(settings.classificationLabelObserved)"]!
                            }) {
                                Image(("\(similar3["\(settings.classificationLabelObserved)"]!)"))
                                        .resizable()
                                             .scaledToFit()
                                               .cornerRadius(25)
                                              .frame(width: 100, height: 100, alignment: .leading)
                                               .overlay(RoundedRectangle(cornerRadius: 25)
                                                 .stroke(Color(red: 0.302, green: 0.6078, blue: 0.5412), lineWidth: 3), alignment: .center)
                            }
                        
                                                      Spacer()
                                 }  .frame(width: 450, height: 130, alignment: .center)
                                                       .background(Color.white)

                }.background(Color.white)
        
                    
        }.background(Color(red: 0.3686, green: 0.7373, blue: 0.7176))
             
    
                
            }
       }
        
}
        

struct MainInfo_Previews: PreviewProvider {
    static var previews: some View {
        MainInfo()
    }
}
