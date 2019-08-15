//
//  Character View Model.swift
//  Star Wars MVVM demo
//
//  Created by Jonathan T. Miles on 8/13/19.
//  Copyright © 2019 Jonathan T. Miles. All rights reserved.
//

import Foundation

/*
 o class for the view model
 o protocol that requires a property (var) for the arrays here
 x delegate class that has a "did the array finish loading?" function
 x conform protocol to delegate (use stubs)
 x in the view controller adopt both the protocol (which brings the viewModel class) and the delegate (which can handle reloading the view once the data is finished)
 */

//protocol IsCharacterViewModel: CharacterViewModelDelegate {
//    var characters: [SWAPICharacter] { get set }
//}

protocol CharacterViewModelDelegate: AnyObject {
    func fetchCharacters()
    func didFinishFetchingData(isTrue: Bool) -> Bool
//    var delegate: CharacterViewModelDelegate { get set }
//    func didFinishFetchingData(viewModel: IsCharacterViewModel)
}

protocol CharacterDidFinishDownloadingDelegate: AnyObject {
    func didFinishDownloading(_ sender: CharacterViewModel)
}

let requestURL = URL(string: "https://swapi.co/api/people/")!

class CharacterViewModel: CharacterViewModelDelegate {
    
    func didFinishFetchingData(isTrue: Bool) -> Bool {
        return isTrue
    }
    
    weak var delegate: CharacterDidFinishDownloadingDelegate?

    var characters: [SWAPICharacter]? {
        didSet {
//            didFinishFetchingData(isTrue: true)
        }
    }

    func fetchCharacters() {
        
        let request = URLRequest(url: requestURL)
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("Error with URLSession fetching characterViewModels: \(error)")
            }
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(SWAPIResultsCharacter.self, from: data)
                    self.characters = decodedData.results
                    self.delegate?.didFinishDownloading(self)
                } catch {
                    NSLog("Error decoding data from JSON fetch: \(error)")
                }
            }
        }.resume()
    }
}
