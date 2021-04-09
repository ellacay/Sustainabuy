//
//  Calendar.swift
//  Sustainabuy
//
//  Created by EllaCaySmith on 29/10/20.
//  Copyright © 2020 EllaCaySmith. All rights reserved.
//

import Foundation
import SwiftUI
import UserNotifications

struct Calendar: View{
    @ObservedObject var data = Data()
    @EnvironmentObject var settings: Data
    @State var Monday = false
    @State var Tuesday = false
    @State var Wednesday = false
    @State var Thursday = false
    @State var Friday = false
    @State var Saturday = false
    @State var Sunday = false
    

    var body: some View{
       
        VStack(spacing:20){
            
            Spacer()
               
                    VStack(spacing:40) {
                        VStack{
                        Text("Calendar")
                            .font(.custom("Courier", size: 40))
                            
                        Text("Enter your shopping days for a reminder to SUSTAINABUY!")
                            .font(.custom("Avenir", size: 18))
                        }
                        
                      
                        VStack{
                            Toggle(isOn: $Monday) {
                                           Text("Monday").font(.custom("Courier", size: 25))
                            }
                        
                        
                        Toggle(isOn:$Tuesday ) {
                            
                            Text("Tuesday").font(.custom("Courier", size: 25))
                        }
                           
                        Toggle(isOn: $Wednesday) {
                           
                            Text("Wednesday").font(.custom("Courier", size: 25))
                            
                        }
                        Toggle(isOn: $Thursday) {
                           
                            Text("Thursday").font(.custom("Courier", size: 25))
                        }
                        Toggle(isOn: $Friday) {
                            
                            Text("Friday").font(.custom("Courier", size: 25))
                        }
                        Toggle(isOn: $Saturday) {
                            
                            Text("Saturday").font(.custom("Courier", size: 25))
                        }
                        Toggle(isOn: $Sunday) {
                            
                            Text("Sunday").font(.custom("Courier", size: 25))
                        }
                        }
                    
                        Button(("Save") ){
                            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                                if success {
                                    print("All set!")
                                } else if let error = error {
                                    print(error.localizedDescription)
                                }
                            }
                            
                            let content = UNMutableNotificationContent()
                            if Monday == true{
                                content.subtitle = "Its time to shop with SUSTAINABUY on Monday"
                                content.sound = UNNotificationSound.default

                                // show this notification five seconds from now
                                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                                // choose a random identifier
                                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                                // add our notification request
                                UNUserNotificationCenter.current().add(request)
                               
                            }
                            if Tuesday == true{
                                content.subtitle = "Its time to shop with SUSTAINABUY on Tuesday"
                                content.sound = UNNotificationSound.default

                                // show this notification five seconds from now
                                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                                // choose a random identifier
                                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                                // add our notification request
                                UNUserNotificationCenter.current().add(request)
                                
                            }
                            if Wednesday == true{
                                content.subtitle = "Its time to shop with SUSTAINABUY on Wednesday"
                                content.sound = UNNotificationSound.default

                                // show this notification five seconds from now
                                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                                // choose a random identifier
                                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                                // add our notification request
                                UNUserNotificationCenter.current().add(request)
                                
                            }
                            if Thursday == true{
                        
                                content.subtitle = "Its time to shop with SUSTAINABUY on Thursday"
                                content.sound = UNNotificationSound.default

                                // show this notification five seconds from now
                                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                                // choose a random identifier
                                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                                // add our notification request
                                UNUserNotificationCenter.current().add(request)
                            }
                            if Friday == true{
                                content.subtitle = "Its time to shop with SUSTAINABUY on Friday"
                                content.sound = UNNotificationSound.default

                                // show this notification five seconds from now
                                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                                // choose a random identifier
                                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                                // add our notification request
                                UNUserNotificationCenter.current().add(request)
                            }
                            if Saturday == true{
                                content.subtitle = "Its time to shop with SUSTAINABUY on Saturday"
                                content.sound = UNNotificationSound.default

                                // show this notification five seconds from now
                                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                                // choose a random identifier
                                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                                // add our notification request
                                UNUserNotificationCenter.current().add(request)
                                
                            }
                            if Sunday == true{
                                content.subtitle = "Its time to shop with SUSTAINABUY on Sunday"
                                content.sound = UNNotificationSound.default

                                // show this notification five seconds from now
                                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                                // choose a random identifier
                                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                                // add our notification request
                                UNUserNotificationCenter.current().add(request)
                            }
                           
                            Spacer()
                      
                        }
                    
                
                      

                    }
                    .padding(.all, 20.0)
                    .frame(width: 300, height: 600, alignment: .center)
                    .background(Color.white)
                    
                    .cornerRadius(25)
                    .overlay(RoundedRectangle(cornerRadius: 25)
                    .stroke(Color(red: 0.302, green: 0.6078, blue: 0.5412), lineWidth: 3), alignment: .center)
                   
            

                
                                  
                                  
                              
                                    
                    
                
                 
                        Spacer()
       
        }.frame(width: 450, height: 1000, alignment: .center)
        .background(Color(red: 0.3686, green: 0.7373, blue: 0.7176))
    }
    }




struct Calendar_Previews: PreviewProvider {
    static var previews: some View {
      Calendar()
    }
}
