//
//  CharacterTableViewController.swift
//  Star Wars MVVM demo
//
//  Created by Jonathan T. Miles on 8/14/19.
//  Copyright © 2019 Jonathan T. Miles. All rights reserved.
//

import UIKit

class CharacterTableViewController: UITableViewController, CharacterDidFinishDownloadingDelegate {
    
    let characterInterface = CharacterViewModel()
    
    func didFinishDownloading(_ sender: CharacterViewModel) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        characterInterface.delegate = self
        characterInterface.fetchCharacters()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterInterface.characters?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath)

        cell.textLabel?.text = characterInterface.characters?[indexPath.row].name

        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
