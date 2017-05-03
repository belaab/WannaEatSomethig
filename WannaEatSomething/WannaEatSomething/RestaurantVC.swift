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


struct info{
    let name: String!
    //let location: String!
}


class RestaurantVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet var selectedItem: UILabel!
    
    
    
    var chosed : String!
   // selectedItem.text = chosed
    
    @IBOutlet var tableView: UITableView!
    
    var infoArray = [info]()
    
    let manager = CLLocationManager()

    
    let SearchURL = "https://api.foursquare.com/v2/venues/search?ll=52.13,21&client_id=5O53IDZJAWB12DFHH1WFEYL2I1I3L0BTYQPHZUGJZYFL5IO4&client_secret=DXVEG1PDN0NMSOOZRRLJTWXTAON4RUL3GJSXAZVVEKHP40A3&query=burger&v=20170501"
    
    
         
    let clientID = "5O53IDZJAWB12DFHH1WFEYL2I1I3L0BTYQPHZUGJZYFL5IO4"
    let clientSecret = "DXVEG1PDN0NMSOOZRRLJTWXTAON4RUL3GJSXAZVVEKHP40A3"
    
   // selectedItem.text = "DUPA"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedItem.text = chosed
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
                                let item = venues[i]
                                //print(item)
                                let name = item["name"] as! String
                               // print(name)
                                
                                infoArray.append(info.init(name: name))
                                DispatchQueue.main.async {
                                self.tableView.reloadData()
                                }
                            }
                        }
                        
                    }
                
                    //print(readableJSON)
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
        return infoArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResCell") as! ResCell
        
        cell.name.text = infoArray[indexPath.row].name!
        
       // cell.name.text = uilabel
        
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
