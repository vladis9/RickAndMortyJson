//
//  MainViewController.swift
//  RickAndMortyJson
//
//  Created by Vlad Zinevich on 25.08.2021.
//

import UIKit

enum UserActions: String, CaseIterable {
    case Rick = "Rick"
    case Morty = "Morty"
}

class MainViewController: UICollectionViewController {

    private let userActions = UserActions.allCases
    
    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return userActions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! UserActionViewCell
    
        cell.userActionLabel.text = userActions[indexPath.item].rawValue
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function)
        let userAction = userActions[indexPath.item]
        
        switch userAction {
        case .Rick:
            performSegue(withIdentifier: "Rick", sender: self)
        case .Morty:
            performSegue(withIdentifier: "Morty", sender: self )
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let charactersVC = segue.destination as! CharactersViewController
        
        switch segue.identifier {
        case "Rick":
            charactersVC.fetchDataRick()
        case "Morty":
            charactersVC.fetchDataMorty()
        default:
            break
        }
    }
}


//MARK: - UICollectionViewDelegateFlowLayout

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
}
