//
//  HouseViewController.swift
//  halanx
//
//  Created by Siddharth Sen on 24/06/19.
//  Copyright © 2019 halfpolygon. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class HouseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    //Implement Search
    var filteredHouses = [House]()
    
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredHouses = houses.filter({( house : House) -> Bool in
            return (house.title?.lowercased().contains(searchText.lowercased()))!
        })
        
        houseTableView.reloadData()
    }

    
    //determine if you are currently filtering results or not
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }

  
    //Constants
    let URL_GET_DATA = "http://testapi.halanx.com/homes/houses/?accomodation_allowed=girls%2Cboys%2Cfamily&accomodation_type=flat%2Cshared%2Cprivate&format=json&furnish_type=full%2Csemi&house_type=independent%2Cvilla%2Capartment&latitude=28.6554&longitude=77.1646&radius=5&rent_max=20000&rent_min=1000"
    
    //Outlets
    @IBOutlet weak var houseTableView: UITableView!
    
    
    //Array
    var houses = [House]()
    
    
    //Search
    let searchController = UISearchController(searchResultsController: nil)
    
    
    
    //check whether the user is searching or not, and use either the filtered or normal houses
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredHouses.count
        }
        
        return houses.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HouseTableViewCell
        let house: House
        if isFiltering() {
            house = filteredHouses[indexPath.row]
        } else {
            house = houses[indexPath.row]
        }
        cell.houseTitle.text = house.title
        cell.houseRent.text = house.rent
        cell.houseAddress.text = house.street_address
        
        
                //Image Corner Radius
                cell.houseImg.layer.cornerRadius = 10.0
                //Shadow
                cell.contentView.layer.cornerRadius = 2.0
                cell.contentView.layer.borderWidth = 1.0
                cell.contentView.layer.borderColor = UIColor.clear.cgColor
                cell.contentView.layer.masksToBounds = true
                cell.layer.shadowColor = UIColor.lightGray.cgColor
                cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
                cell.layer.shadowRadius = 2.0
                cell.layer.shadowOpacity = 1.0
                cell.layer.masksToBounds = false
                cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        
        
        Alamofire.request(house.imageurl!).responseImage { response in
        if let image = response.result.value {
                cell.houseImg.image = image
            }
        }
        
        
        return cell
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Houses"
        searchController.searchBar.tintColor = .white
        searchController.searchBar.barTintColor = .white
        navigationItem.searchController = searchController
        definesPresentationContext = true
        


        Alamofire.request(URL_GET_DATA).responseJSON { response in
            
            let json = JSON (response.result.value!)
            
            if (true) {

                let housesArray:NSArray = json["results"].arrayObject! as NSArray
                
                for i in 0..<housesArray.count{

                    self.houses.append(House(
                            title: (housesArray[i] as AnyObject).value(forKey: "name") as? String,
                            rent:  (housesArray[i] as AnyObject).value(forKey: "house_size") as? String,
                            street_address:  (housesArray[i] as AnyObject).value(forKey: "furnish_type") as? String,
                            imageurl:  (housesArray[i] as AnyObject).value(forKey: "cover_pic_url") as? String
                    ))
                }
                self.houseTableView.reloadData()
            }
        }
    }
    

}


extension HouseViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)

    }
}
