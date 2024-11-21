//
//  AlertView.swift
//  Touchdown
//
//  Created by Adwait Barkale on 19/11/24.
//

import SwiftUI

struct AlertView1: View {
    
    var title: String
    var message: String
    var btnTitle: String = "Ok"
    @Binding var isVisible: Bool
    var btnOkTapped: () -> Void
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    isVisible = false
                    self.btnOkTapped()
                }
            
            VStack(spacing: 10) {
                Text("\(title)")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Text("\(message)")
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 10)
                
                Button(action: {
                    isVisible = false
                    self.btnOkTapped()
                }, label: {
                    Text(btnTitle)
                })
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .background(
                    Color.blue
                        .clipShape(Capsule())
                )
                .onTapGesture {
                    isVisible = false
                    self.btnOkTapped()
                }
                .padding(.top, 14)
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 10)
            .padding(.horizontal, 20) // Adjust the padding for a better layout
            .padding(.vertical, 20)
            .frame(width: 350)
            .background(Color.white) // Adjust the opacity to a more subtle value
            .cornerRadius(12) // Add rounded corners for better visuals
            .shadow(radius: 10) // Optionally, add shadow for better visibility
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    @State static var isAlertVisible = true // Local state for preview
    
    static var previews: some View {
        AlertView1(title: "Alert", message: "This functionality is yet to be developed This functionality is yet to be developed", isVisible: $isAlertVisible, btnOkTapped: {})
            .previewLayout(.sizeThatFits) // Optional: Adjusts the preview size
            .padding()
            .previewDisplayName("ContentView with Custom Alert")
    }
}
