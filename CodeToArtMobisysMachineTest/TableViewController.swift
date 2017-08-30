//
//  TableViewController.swift
//  CodeToArtMobisysMachineTest
//
//  Created by harshad kekane on 30/08/17.
//  Copyright © 2017 harshad kekane. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

class TableViewController: UITableViewController {
    var jsontitle: NSArray = [],jsonposterpath: NSArray = [],jsonadult
        : NSArray = [],jsonreleasedate: NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        Alamofire.request("https://api.themoviedb.org/3/movie/upcoming?api_key=b7cd3340a794e5a2f35e3abb820b497f").responseJSON { response in
//            print("Request: \(String(describing: response.request))")   // original url request
//            print("Response: \(String(describing: response.response))") // http url response
//            print("Result: \(response.result)")                         // response serialization result
            
//            print("response:\(String(describing: response))")
            
            
            if let json = response.result.value {
//                print("JSON: \(json)") // serialized json response
                
                let JSON = json as! NSDictionary
//                print(JSON)
                
                let jsonresults=JSON.value(forKey: "results") as! NSArray
//                print(jsonresults)
                
                 self.jsontitle = jsonresults.value(forKey: "title") as! NSArray
//                print(self.jsontitle.count)
                
                 self.jsonposterpath = jsonresults.value(forKey: "poster_path") as! NSArray
//                print(jsonposterpath)

                 self.jsonadult = jsonresults.value(forKey: "adult") as! NSArray
                print(self.jsonadult)

                 self.jsonreleasedate = jsonresults.value(forKey: "release_date") as! NSArray
//                print(jsonreleasedate)

                
                 self.tableView .reloadData()
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//                print("Data: \(utf8Text)") // original server data as UTF8 string
                
            }
        }
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
//        self.tableView .reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       print("hello:",self.jsontitle.count.hashValue)
        return self.jsontitle.count .hashValue
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell

        // Configure the cell...

        cell.imageViewCell.sd_setImage(with: URL(string: "http://image.tmdb.org/t/p/w185/\(String (describing:jsonposterpath.object(at: indexPath.row)))"), placeholderImage: nil)
        
        print(self.jsontitle .object(at: indexPath.row) as? String)
        
        cell.nameLabelCell.text=self.jsontitle .object(at: indexPath.row) as? String
        cell.dateLblCell.text=self.jsonreleasedate.object(at: indexPath.row) as? String
        cell.categoryLblCell.text="pratik"//self.jsonadult .object(at: indexPath.row) as? String
        
       
        return cell
    }
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//    }

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
