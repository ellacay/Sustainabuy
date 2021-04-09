//
//  Barcode.swift
//  Sustainabuy
//
//  Created by EllaCaySmith on 29/10/20.
//  Copyright © 2020 EllaCaySmith. All rights reserved.
//

import Foundation
import SwiftUI
struct Barcode: View {

 @State private var object = ""
 
    @EnvironmentObject var settings: Data
    @ObservedObject var data = Data()
     @State var capturedImage: Image? = nil
     @State var showCaptureImageView: Bool = false
 let model = Product()
 @State var classificationLabel: String = "M&M's"
 

 // this is the function that performs the prediction. it needs to resize the image as the model prediction requires 299 width and height
    private func performImageClassification(){

        let img = UIImage(named:"M&M's")
        let imgResized = img?.resizeImageTo(size: CGSize(width: 299, height: 299))
        guard let buffer = imgResized!.toBuffer() else { return
           
        }
        let output = try? model.prediction(image: buffer)
        if let output = output{
            self.settings.classificationLabelObserved  = output.classLabel
                        self.settings.classificationLabelObserved  = "M&M's"
         
            
        }
 
     
 }
 var photo = false
 var slideup = false

 // this variable needs to change to true for the next view to slide up
 @State private var showingSheet = false
    
    @EnvironmentObject private var searchFunction:SearchFunction
    var body: some View {
        VStack {
            HStack{
                Spacer()
                HStack{
                TextField("Search", text: $searchFunction.search)
                  
                        .font(.custom("Courier", size:20))
                        .foregroundColor(Color.black)
                Button(action: {
                
                    searchFunction.searchEnabled = true
                    self.classificationLabel = self.searchFunction.search
                    self.settings.classificationLabelObserved = classificationLabel
    
                }) {
                  Image(systemName: "magnifyingglass")
                }
              
                }
                .frame(width: 300, height: 50, alignment: .center)
                    .padding(8.0)
                    .background(Color.white)
                    .overlay(RoundedRectangle(cornerRadius: 25)
                    .stroke(Color(red: 0.3686, green: 0.7373, blue: 0.7176), lineWidth: 3), alignment: .center)
                      Spacer()
                
            }
            
            
            NavigationView{
           ZStack {
       
             VStack {
               
                 
Spacer()
               Button(action: {
                 self.showCaptureImageView.toggle()
                searchFunction.cameraEnabled = true
               }) {
                 Image(systemName: "camera")
               }
                
               
    Spacer()
     
                 Spacer()
             Button("Continue"){
                   
                                            self.showingSheet.toggle()
                if searchFunction.searchEnabled == true {
                    self.settings.classificationLabelObserved = classificationLabel
                    searchFunction.searchEnabled = false
                    
                }
                if searchFunction.cameraEnabled == true{
                    self.performImageClassification()
                    
                    self.settings.classificationLabelObserved = "M&M's"
                    searchFunction.cameraEnabled = false
                }
//                self.settings.classificationLabelObserved = "Smarties"
                 
             }.frame(width: 450, height: 100, alignment: .center)
             .background(Color(red: 0.3686, green: 0.7373, blue: 0.7176))
              .cornerRadius(40)
                 .font(.custom("Courier", size:20))
                 .foregroundColor(Color.white)
             .sheet(isPresented: $showingSheet){
                 SlideUpView()}
             
                
                 
                 
            
         

             
//               capturedImage?.resizable()
//                 .frame(width: 250, height: 250)
//                 .clipShape(Circle())
//                 .overlay(Circle().stroke(Color.white, lineWidth: 4))
//                 .shadow(radius: 10)
                 
      
             
                 
                     
                 

             }
             if showCaptureImageView == true {
               CaptureImageView(isShown: $showCaptureImageView, image: $capturedImage)
             }
             
             
           }
            }
        }
}
}
struct CaptureImageView {
    
    /// MARK: - Properties
    @Binding var isShown: Bool
    @Binding var image: Image?
    
    func makeCoordinator() -> Coordinator {
      return Coordinator(isShown: $isShown, image: $image)
    }
}
extension CaptureImageView: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<CaptureImageView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<CaptureImageView>) {
        
    }
}

class SearchFunction: ObservableObject {
    @Published var search = ""
    @Published var cameraEnabled = false
    @Published var searchEnabled = false
}

struct Barcode_Previews: PreviewProvider {
    static var previews: some View {
        Barcode()
    }
}
