//
//  ViewController.swift
//  scroll
//
//  Created by mac on 22/5/2017.
//  Copyright © 2017 WigWar. All rights reserved.
//

/*import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let Stores = ["avon","boardmans","champs","dariel","Entellect","Foshini","Google","Hundai","Indego","JP Morgan & Chase","Kelatoni","Lucky 7","Morin","Nexus","Ocean Busket","Pioneer","Q Sound","Royal Bank","SARS","Siemens","Samsung","Telkom","Unilever","Vodacom","WoolWorths","Xerox","ZTE tech"]
    
    
    var storesSection = [String]()
    var stores_name_Dict = [String:[String]]()
    
    func generateStoresDict(){
        
    
        for store in Stores {
            
            let key = "\(store[store.startIndex])"
            let lower = key.lowercased()
           
            
            if var wordValues = stores_name_Dict[lower]{
                wordValues.append(store)
                stores_name_Dict[lower] = wordValues
            }else{
                stores_name_Dict[lower] = [store]
            }
        }
        
        
        storesSection = [String](stores_name_Dict.keys)
        storesSection = storesSection.sorted()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateStoresDict()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   func numberOfSections(in tableView: UITableView)-> Int{
        return storesSection.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int ) -> String? {
        return storesSection[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        let wordKey = storesSection[section]
        if let wordValues = stores_name_Dict[wordKey]{
            return wordValues.count
        }
        return 0
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath )-> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let wordKey = storesSection[indexPath.section]
        if stores_name_Dict[wordKey.lowercased()] != nil{
            cell.textLabel?.text = Stores[indexPath.row]
        }
        if stores_name_Dict[wordKey.uppercased()] != nil{
            cell.textLabel?.text = Stores[indexPath.row]
        }

        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return storesSection
    }
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
     return index
    }
}
 */

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet var tableView: UITableView!
    var contents = [String: [String]]()
    var headers = [String]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let garageKey = "Garage";
        let masterBathroomKey = "Master Bathroom";
        let diningRoomKey = "Dining Room";
        let guestBathroomKey = "Master Bedroom";
        let kitchenKey = "Kitchen";
        let denKey = "Den";
        
        let garage = [ "Motor Oil", "Light Bulbs", "Trash Bags", "Flashlight" ];
        let masterBathroom = [ "Soap", "Shampoo", "Toothpaste", "Hair Spray", "First Aid" ];
        let diningRoom = [String]();
        let guestBathroom = [ "Hand Soap", "Tissues", "Toilet Paper" ];
        let kitchen = [ "Milk", "Bread", "Pizza", "Juice", "Cheese", "Coffee" ];
        let den = [ "Pens", "Pencils", "Paper", "Stamps" ];
        
        contents[garageKey] = garage
        contents[masterBathroomKey] = masterBathroom
        contents[diningRoomKey] = diningRoom
        contents[guestBathroomKey] = guestBathroom
        contents[kitchenKey] = kitchen
        contents[denKey] = den
        
        headers.append(garageKey)
        headers.append(masterBathroomKey)
        headers.append(diningRoomKey)
        headers.append(guestBathroomKey)
        headers.append(kitchenKey)
        headers.append(denKey)
    }
    
    func itemAtIndexPath(indexPath: NSIndexPath) -> String
    {
        let key = headers[indexPath.section]
        if let groupArray = contents[key]
        {
            let text = groupArray[indexPath.row]
            
            return text
        }
        
        return ""
    }
    
    // MARK: - UITableViewDataSource Methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return headers.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return headers[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let key = headers[section]
        if let groupArray = contents[key]
        {
            return groupArray.count
        }
        
        return 0
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "Plain")
        
        let text = itemAtIndexPath(indexPath: indexPath as NSIndexPath)
        
        cell.textLabel?.text = text
        
        return cell;
    }
    
    // MARK: - UITableViewDelegate Methods
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let text = itemAtIndexPath(indexPath: indexPath)
        
        print(text)
    }
}

func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]?
{
    return headers
}

func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]?
{
    var titles = [String]()
    
    for header in headers
    {
        var title = ""
        let words = header.componentsSeparatedByString(" ")
        for word in words
        {
            let firstLetterRange = word.startIndex..<word.startIndex.advancedBy(1)
            let firstLetter = word[firstLetterRange].uppercaseString
            title = title + firstLetter
        }
        titles.append(title)
    }
    
    return titles
}

