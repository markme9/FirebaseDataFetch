//
//  ContentView.swift
//  FirebaseDataFetch
//
//  Created by zoya me on 11/9/22.
//

import SwiftUI
import Firebase
import FirebaseStorage

struct ContentView: View {
    
    @StateObject var vm = ViewModel()
    @State var isPresented: Bool = false
    @State var text: String = ""
    
    init() {
        let navigation = UINavigationBar.appearance()
        navigation.largeTitleTextAttributes = [.foregroundColor: UIColor.black, .font: UIFont(name: "PlayfairDisplay-Bold", size: 40) as Any]
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                    ForEach(vm.postData) { item in
                        VStack(alignment: .leading) {
                            Card(cardData: item)
                                
                        }
                        
                    }
                    .onAppear {
                        vm.getData()
                    }
                    
                }
            .navigationTitle(Text("People's username"))
            .navigationBarItems(trailing: Button(action: {
                self.isPresented.toggle()
                
                
            }, label: {
                Image(systemName: "plus")
                    .imageScale(.medium)
                    .font(.headline)
                    .frame(width: 30, height: 30)
                    .background(Color(UIColor.magenta))
                    .foregroundColor(.white)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .shadow(radius: 5)
                
            })
            .fullScreenCover(isPresented: $isPresented) {
                DetailView()
                
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
