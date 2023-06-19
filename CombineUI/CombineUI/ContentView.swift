//
//  ContentView.swift
//  CombineUI
//
//  Created by satheesh kumar on 19/06/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = UserVM()
    var body: some View {
        ZStack {
            List(vm.user){ user in
                VStack(alignment: .leading){
                    Text(user.name)
                    Text(user.email)
                }
                
            }.listStyle(.plain)
        }.onAppear(perform: vm.fetchUsers)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
