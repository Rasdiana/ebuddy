//
//  UserView.swift
//  EbuddyProject
//
//  Created by Rasdiana Sari on 21/12/24.
//

import SwiftUI
import _PhotosUI_SwiftUI

struct UserView: View {
    @ObservedObject private var viewModel = UserViewModel()
    @Environment(\.colorScheme) var colorScheme
    @State var imageSelection: PhotosPickerItem? = nil
    @State var uiImage: UIImage? = nil
    @State var apiService = Service()
    var body: some View {
        VStack (alignment: .leading) {
            //COMMIT 1 - 3
            if !viewModel.listUser.isEmpty { //only display data if the
                List (viewModel.listUser) { item in
                    VStack (alignment: .leading){
                        Text(item.email ?? "")
                        Text(item.ge! == GenderEnum.female.rawValue ? "Female" : "Male")
                        
                        Text(item.phoneNumber ?? "")
                        Text(item.uid ?? "")
                        Text(item.servicePrice?.stringValue ?? "")
                        Text(String(item.rating ?? 0))
                        if (item.media != "") {
                            AsyncImage(url: URL(string: item.media!)) { image in
                                image.resizable()
                            } placeholder: {
                                Color.red
                            }
                            .frame(width: 128, height: 128)
                            .clipShape(.rect(cornerRadius: 25))
                        }
                        
                        HStack{
                            PhotosPicker(
                                
                                selection: $imageSelection,
                                matching: .images,
                                photoLibrary: .shared()) {
                                    Image(systemName: "camera.circle.fill")
                                        .font(.system(size: 50))
                                        .foregroundColor(.gray)
                                }
                            Button("Submit"){
                                Task { @MainActor in
                                    if let data = try? await imageSelection?.loadTransferable(type: Data.self) {
                                        uiImage = UIImage(data:data)
                                        apiService.uploadImage(uuid: item.uid!, image: uiImage!){ url in
                                            apiService.updateImageFirestore(url: url, uuid: item.uid!)
                                        }
                                        return
                                    }
                                }
                            }.padding(.leading)
                        }
                    }
                }
            }else{
                Text("user.uid ?? ")
            }
        }.padding(.leading)
        
    }
    
}

#Preview {
    UserView().preferredColorScheme(.dark)
}
