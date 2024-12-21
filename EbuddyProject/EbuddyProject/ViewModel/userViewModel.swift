//
//  userViewModel.swift
//  EbuddyProject
//
//  Created by Rasdiana Sari on 19/12/24.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class UserViewModel: ObservableObject {

    @Published var user : UserJson? = nil // now an optional
    @Published var listUser : [UserJson] = [UserJson]()

    private var db = Firestore.firestore()
    init()  {
        fetchData() 
    }
    
    
    
    func fetchDataMultipleQueries() {
        db.collection("USERS").order(by: "active", descending: true).order(by: "rating", descending: true).order(by: "service_price", descending: false).whereField("ge", isEqualTo: 1)
                .addSnapshotListener { [weak self] (querySnapshot, error) in
                  guard let documents = querySnapshot?.documents else {
                    print("No documents in 'colors' collection")
                    return
                  }
                  
                    self?.listUser = documents.compactMap { queryDocumentSnapshot in
                        let result = Result { try queryDocumentSnapshot.data(as: UserJson.self) }
                    
                        switch result {
                        case .success(let us):
                            return us
                        case .failure(let error):
                            print("Error decoding document: \(error)")
                            return nil;
                        }
                        
                  }
            }
        }
    
    //COMMIT 9
    func fetchData() {
        db.collection("USERS")
                .addSnapshotListener { [weak self] (querySnapshot, error) in
                  guard let documents = querySnapshot?.documents else {
                    print("No documents in 'colors' collection")
                    return
                  }
                  
                    self?.listUser = documents.compactMap { queryDocumentSnapshot in
                        let result = Result { try queryDocumentSnapshot.data(as: UserJson.self) }
                    
                        switch result {
                        case .success(let us):
                            return us
                        case .failure(let error):
                            print("Error decoding document: \(error)")
                            return nil;
                        }
                        
                  }
            }
        }
    
    func add() async{
        do {
          let ref = try await db.collection("USERS").addDocument(data: [
            "email": "rasdiana@gmail.com",
            "ge": "1",
            "phone_number": "0821311031",
          ])
          print("Document added with ID: \(ref.documentID)")
        } catch {
          print("Error adding document: \(error)")
        }

    }
    
    func update() async{
        //HxB3Y6nFDlnNJNRKHU62
        do {
            try await db.collection("USERS").document("HxB3Y6nFDlnNJNRKHU62").updateData(["uid": "HxB3Y6nFDlnNJNRKHU62"])
          
        } catch {
          print("Error adding document: \(error)")
        }
    }
    
    
    func login(){
        Task {
            do {
                try await auth()
                sleep(4)
            }catch {
                print("Can not login")
            }
                
        }
    }
    
    func auth() async throws{
        _ = try await Auth.auth().signIn(withEmail: "if08055@gmail.com", password:"ebuddytest")
        
    }
}
