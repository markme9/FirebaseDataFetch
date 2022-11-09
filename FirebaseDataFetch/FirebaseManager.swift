//
//  FirebaseManager.swift
//  FirebaseDataFetch
//
//  Created by zoya me on 11/9/22.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage

struct PostModel: Identifiable {
    var id = UUID()
    var name: String
    var user_name: String
}

class ViewModel: ObservableObject {
    @Published var postData: [PostModel] = []
    
    let db = Firestore.firestore()
    
    func getData() {
        db.collection("post").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No data returned")
                return
            }
            self.postData = documents.map({ (querySnapshotData) -> PostModel in
                let data = querySnapshotData.data()
                let name = data["name"] as? String ?? ""
                let user_name = data["user_name"] as? String ?? ""
                return PostModel(name: name, user_name: user_name)
            })
        }
    }
    func addData(name: String, user_name: String) {
        guard (try? db.collection("post").addDocument(data: ["name": name, "user_name": user_name])) != nil else {
            return
            
        }
    }
}

