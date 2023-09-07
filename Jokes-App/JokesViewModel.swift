//
//  JokesViewModel.swift
//  Jokes-App
//
//  Created by Terry Jason on 2023/9/7.
//

import Foundation
import Alamofire

class JokesViewModel: ObservableObject {
    
    @Published var jokes = [Value]()

    init() {
        getJokes()
    }
    
}


// MARK: Networking

extension JokesViewModel {
    
    func getJokes() {
        
        AF.request(
            "https://raw.githubusercontent.com/atilsamancioglu/JokesAppJsonData/main/chuck.json",
            method: .get
        ).responseDecodable(of: JokesData.self) { [self] response in
            rsponseHandle(response)
        }
        
    }
    
    private func rsponseHandle(_ res: DataResponse<JokesData, AFError>) {
        switch res.result {
        case .success(let data):
            jokes = data.value
        case .failure(let error):
            print(error)
        }
    }
    
}


// https://raw.githubusercontent.com/atilsamancioglu/JokesAppJsonData/main/chuck.json
