//
//  Service.swift
//  EbuddyProject
//
//  Created by Rasdiana Sari on 21/12/24.
//

import UIKit
import FirebaseStorage
import FirebaseFirestore

public class Service{
    let storage = Storage.storage()
    
    init(){
        
    }
    
    func uploadImage(uuid : String, image : UIImage, completion : @escaping (String) -> Void) {
        print("uuid : \(uuid)")
        let storageRef = storage.reference().child("images/\(uuid).jpg")
      

        let data = image.jpegData(compressionQuality: 0.2)

        storageRef.putData(data!, metadata: nil) { metadata, error in
            if let error = error {
                print("Error : \(error)")
                return
            }
            
            storageRef.downloadURL { url, error in
                if let error = error {
                    print("Error : \(error)")
                    return
                }
                
                guard let url = url else { return }
                completion(url.absoluteString)
            
            }
        }
    }
    
    func updateImageFirestore(url : String, uuid : String){
        let db = Firestore.firestore()
        let ref = db.collection("users").document(uuid)
        
        ref.setData([
            "imageUrl" : url
        ]) { error in
            if let error {
                print("Error : \(error)")
            }else{
                print("Successfully updated")
            }
        
        }
    }
}
