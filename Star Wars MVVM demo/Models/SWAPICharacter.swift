//
//  SWAPICharacter.swift
//  Star Wars MVVM demo
//
//  Created by Jonathan T. Miles on 8/13/19.
//  Copyright © 2019 Jonathan T. Miles. All rights reserved.
//

import Foundation

struct SWAPICharacter: Codable {
    let name: String
    let height: String
    let birth_year: String
}

struct SWAPIResultsCharacter: Codable {
    let results: [SWAPICharacter]
}
