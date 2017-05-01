//
//  RestaurantVC.swift
//  WannaEatSomething
//
//  Created by Iza on 01.05.2017.
//  Copyright © 2017 IB. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class RestaurantVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let manager = CLLocationManager()

    
 let SearchURL = "https://api.foursquare.com/v2/venues/search?ll=52.13,21&client_id=5O53IDZJAWB12DFHH1WFEYL2I1I3L0BTYQPHZUGJZYFL5IO4&client_secret=DXVEG1PDN0NMSOOZRRLJTWXTAON4RUL3GJSXAZVVEKHP40A3&query=burger&v=20170501"
    
    
         
         let clientID = "5O53IDZJAWB12DFHH1WFEYL2I1I3L0BTYQPHZUGJZYFL5IO4"
         let clientSecret = "DXVEG1PDN0NMSOOZRRLJTWXTAON4RUL3GJSXAZVVEKHP40A3"
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        callAlamo(url: SearchURL)
//        manager.delegate = self as! CLLocationManagerDelegate
//        manager.desiredAccuracy = kCLLocationAccuracyBest
//        manager.requestWhenInUseAuthorization()
//        manager.startUpdatingLocation()
    }

    
         typealias JSONStandard = [String: AnyObject]
        
    
        func callAlamo(url: String){ //grabs the data from the provided URL
            Alamofire.request(url).responseJSON(completionHandler: {
                response in
                self.parseData(JSONData: response.data!)
            })
        }
        
        
            func parseData(JSONData: Data){
                do{
                    var readableJSON = try JSONSerialization.jsonObject(with: JSONData, options: .mutableContainers) as! JSONStandard
                    if let response = readableJSON["response"] as? JSONStandard{
                        if let venues = response["venues"] as? [JSONStandard] {
                            for i in 0..<venues.count{
                               // print(venues[i])
                                let item = venues[i] as! JSONStandard
                                //print(item)
                                let name = item["name"] as! String
                               // let previewURL = item["preview_url"] as! String
                                print(name)
                            }
                        }
                        
                    }
                
                    //print(readableJSON)
                    print("dupa")
                }catch{
                    print(error)
                }
            }
    
    
        
    
    
//        func locationManager(_ manager: CLLocationManager, didUpdateLocations newLocations: [CLLocation]) {
//        
//                let latestLocation: CLLocation = newLocations.last!
//                var latitude = latestLocation.coordinate.latitude
//                var longitude = latestLocation.coordinate.longitude
//        
//            }
//        
    
        
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResCell", for: indexPath) as! Cell
        
        //let foodObjects = food[indexPath.row]
        
//        cell.background.image = UIImage(named: foodObjects["image"]!)
//        cell.nameLabel.text  = foodObjects["item"]
        
        return cell
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
