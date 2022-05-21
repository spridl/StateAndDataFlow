//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 18.05.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var user: UserManager
    @StateObject private var timer = TimeCounter()
    
    var body: some View {
        VStack {
            Text("Hi, \(user.name)")
                .font(.largeTitle)
                .padding(.top, 80)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .padding(.top, 50)
            ButtonView(timer: timer)
                .padding(.top)
            Spacer()
            LogoutButtonView()
                .padding(.bottom, 40)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}

struct ButtonView: View {
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        Button(action: timer.startTimer) {
            Text(timer.buttonTitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(.red)
        .cornerRadius(20)
        .overlay {
            RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 4)
        }
    }
}

struct LogoutButtonView: View {
    
    @EnvironmentObject private var user: UserManager
    
    @AppStorage(UserDataManager.shared.name) private var name: String?
    @AppStorage(UserDataManager.shared.isRegistered) private var isRegistered: Bool?
    
    var body: some View {
        Button(action: logOutButtonPressed) {
            Text("Log Out")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(.blue)
        .cornerRadius(20)
        .overlay {
            RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 4)
        }
    }
    
    private func logOutButtonPressed() {
        user.name = ""
        name = user.name
        user.isRegistered.toggle()
        isRegistered = user.isRegistered
    }
}
