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

    //Constants
    let URL_GET_DATA = "http://testapi.halanx.com/homes/houses/?accomodation_allowed=girls%2Cboys%2Cfamily&accomodation_type=flat%2Cshared%2Cprivate&format=json&furnish_type=full%2Csemi&house_type=independent%2Cvilla%2Capartment&latitude=28.6554&longitude=77.1646&radius=5&rent_max=20000&rent_min=1000"
    
    
    @IBOutlet weak var houseTableView: UITableView!
    
    var houses = [House]()
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  houses.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HouseTableViewCell
        
        let house:House
        house = houses[indexPath.row]
        
        cell.houseTitle.text = house.title
        cell.houseRent.text = house.rent
        cell.houseAddress.text = house.street_address
        
        
        Alamofire.request(house.imageurl!).responseImage { response in
            if let image = response.result.value {
                cell.houseImg.image = image
            }
        }
      return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Alamofire.request(URL_GET_DATA).responseJSON { response in
            
           let json = JSON (response.result.value)
            
            if (true) {

                let housesArray:NSArray = json["results"].arrayObject as! NSArray
                
                for i in 0..<housesArray.count{

                    self.houses.append(House(
                            title: (housesArray[i] as AnyObject).value(forKey: "name") as? String,
                            rent:  (housesArray[i] as AnyObject).value(forKey: "rent_from") as? String,
                            street_address:  (housesArray[i] as AnyObject).value(forKey: "title") as? String,
                            imageurl:  (housesArray[i] as AnyObject).value(forKey: "cover_pic_url") as? String

                    ))
                }
                self.houseTableView.reloadData()


            }
            
        }
        
    }
    

}
