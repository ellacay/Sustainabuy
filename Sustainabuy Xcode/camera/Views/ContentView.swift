//
//  ContentView.swift
//  camera
//
//  Created by EllaCaySmith on 19/8/20.
//  Copyright © 2020 EllaCaySmith. All rights reserved.
//

import SwiftUI


struct ContentView: View {
   
  
    @State private var showingSheet = false
    
    var body: some View {
       
        // This creates the tab bar at the bottom and creates the image and text
        TabView {
           TabView {
        
            
            Barcode().tabItem{
            Image(systemName: "barcode.viewfinder")
            Text("Barcode")
            }

           
           Profile().tabItem{
             Image(systemName: "person.fill")
             Text("Profile")
             }

            Calendar().tabItem{
             Image(systemName: "calendar")
                         Text("Calendar")
               }
         
          
    }
}
    }
}


//class fun:ObservableObject{
//    @Published var hi = "hey"
//}
class Data:ObservableObject{
    @Published var classificationLabelObserved = "M&M's"

}
    
    

  

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Data())
    }
}

