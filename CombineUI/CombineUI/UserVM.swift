//
//  UserVM.swift
//  CombineUI
//
//  Created by satheesh kumar on 19/06/23.
//

import Foundation
import Combine

class UserVM:ObservableObject {
    @Published var user : [User] = []
    @Published var isApiFailed = false
    @Published var error : userError?
    private var canc = Set<AnyCancellable>()
    func fetchUsers()   {
        let urlString = "https://jsonplaceholder.typicode.com/users"
        guard let url = URL(string: urlString)  else {
          print("url not correcct")
            return
        }
        
        URLSession
            .shared
            .dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .map(\.data)
            .decode(type: [User].self, decoder: JSONDecoder())
            .sink {[weak self] res in
                switch res {
                case .failure(let error):
                    self?.error = userError.custom(error: error)
                default: break
                }
            } receiveValue: { [weak self] users in
                print("users",users)
                self?.user = users
            }.store(in: &canc)
    }
}
extension UserVM{
    enum userError: LocalizedError {
        case custom(error: Error)
        case failedDecoder
        var errorDescription: String?{
            switch self{
            case .failedDecoder:
                return "failed decode"
            case .custom(error: let error):
                return error.localizedDescription
            }
        }
    }
}
