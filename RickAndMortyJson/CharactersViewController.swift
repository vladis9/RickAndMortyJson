//
//  CharactersViewController.swift
//  RickAndMortyJson
//
//  Created by Vlad Zinevich on 24.08.2021.
//

import UIKit

class CharactersViewController: UITableViewController {

    private let jsonUrlRick = "https://rickandmortyapi.com/api/character/1"
    private let jsonUrlMorty = "https://rickandmortyapi.com/api/character/2"
    
    private var characters: [Character] = []

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CharacterCell

        let character = characters[indexPath.row]
        cell.configureCell(with: character)

        return cell
    }

    func fetchDataRick() {
        guard let url = URL(string: jsonUrlRick) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            guard let data = data else { return }
            
            do {
                self.characters = try JSONDecoder().decode([Character].self, from: data)
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
    
    func fetchDataMorty() {
        guard let url = URL(string: jsonUrlMorty) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            guard let data = data else { return }
            
            do {
                self.characters = try JSONDecoder().decode([Character].self, from: data)
            } catch let error {
                print(error)
            }
            
        }.resume()
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
