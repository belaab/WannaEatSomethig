//
//  PlacesVC.swift
//  WannaEatSomething
//
//  Created by Iza on 30.04.2017.
//  Copyright © 2017 IB. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire

class PlacesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    /*let SearchUrl = "https://api.foursquare.com/v2/venues/search?client_id=5O53IDZJAWB12DFHH1WFEYL2I1I3L0BTYQPHZUGJZYFL5IO4&client_secret=DXVEG1PDN0NMSOOZRRLJTWXTAON4RUL3GJSXAZVVEKHP40A3&ll=40.7,-74&query=sushi"
   
    let clientID = "5O53IDZJAWB12DFHH1WFEYL2I1I3L0BTYQPHZUGJZYFL5IO4"
    let clientSecret = "DXVEG1PDN0NMSOOZRRLJTWXTAON4RUL3GJSXAZVVEKHP40A3"
   
    typealias JSONStandard = [String: AnyObject]*/
    
    
    
//    
//    func callAlamo(url: String){ //grabs the data from the provided URL
//        Alamofire.request(url).responseJSON(completionHandler: {
//            response in
//            self.parseData(JSONData: response.data!)
//            
//        })
//    }
//    
//    
//    func parseData(JSONData: Data){
//        do{
//            var readableJSON = try JSONSerialization.jsonObject(with: JSONData, options: .mutableContainers) as! JSONStandard
//                print(readableJSON)
//        }catch{
//            print(error)
//        }
//    }


    
    
    
    
    
    
    
    
    
    
//    let manager = CLLocationManager()
//    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations newLocations: [CLLocation]) {
//        
//        let latestLocation: CLLocation = newLocations.last!
//        var latitude = latestLocation.coordinate.latitude
//        var longitude = latestLocation.coordinate.longitude
//        
//    }
    
    
    
    
   
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        
//        manager.delegate = self as! CLLocationManagerDelegate
//        manager.desiredAccuracy = kCLLocationAccuracyBest
//        manager.requestWhenInUseAuthorization()
//        manager.startUpdatingLocation()
//        
//        callAlamo(url: SearchUrl)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        PlacesVC.delegate = self
        PlacesVC.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
