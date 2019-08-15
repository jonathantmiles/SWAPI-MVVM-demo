//
//  ViewController.swift
//  Star Wars MVVM demo
//
//  Created by Jonathan T. Miles on 8/13/19.
//  Copyright © 2019 Jonathan T. Miles. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CharacterDidFinishDownloadingDelegate {

    let characterInterface = CharacterViewModel()
    weak var delegate: CharacterViewModelDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        characterInterface.fetchCharacters()
        characterInterface.delegate = self
        
    }
    
    func didFinishDownloading(_ sender: CharacterViewModel) {
        updateViews()
    }
    
    func updateViews() {
        print("views updated")
    }

}

