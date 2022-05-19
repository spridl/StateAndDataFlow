//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.05.2022.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject private var userManger: UserManager
    
    @State private var textColor = Color.red
    @State private var buttonToggle = true
    
    @AppStorage("name") private var name = ""
    @AppStorage("isRegistered") private var isRegistered = false
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $name)
                    .multilineTextAlignment(.center)
                    .frame(width: 200, height: 20)
                    .onChange(of: name.count, perform: { newValue in
                        checkNameCount(of: newValue)
                    })
                    .padding(.leading, 50)
                Text("\(name.count)")
                    .frame(width: 30, height: 20)
                    .padding(.trailing)
                    .foregroundColor(textColor)
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(buttonToggle)
        }
    }
    
    private func checkNameCount(of nameCount: Int) {
        if nameCount < 3 {
            textColor = .red
            buttonToggle = true
        } else {
            textColor = .green
            buttonToggle = false
        }
    }
    
    private func registerUser() {
        if !name.isEmpty {
            userManger.name = name
            userManger.isRegistered.toggle()
            isRegistered = userManger.isRegistered
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager())
    }
}
