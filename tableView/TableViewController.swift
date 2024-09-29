//
//  TableViewController.swift
//  tableView
//
//  Created by Aslan  on 25.09.2024.
//

import UIKit

class TableViewController: UITableViewController {
    //var array = ["1", "2", "3", "4", "5"]

//    var arrayImage = ["carlos sainz", "charles leclerc", "george russel", "max verstappen", "lewis hamilton"]
//    var arrayNames = ["Carlos", "Charles", "George", "Max", "Lewis"]
//    var arraySurname = ["Sainz", "Leclerc", "Russel", "Verstappen", "Hamilton"]
    
    var arrayPersons = [Person (name: "Carlos", surname: "Sainz", imagename: "carlos sainz"),
                        Person (name: "Charles", surname: "Leclerc", imagename: "charles leclerc"),
                        Person (name: "Lewis", surname: "Hamilton", imagename: "lewis hamilton"),
                        Person (name: "George", surname: "Russel", imagename: "george russel")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func addPerson(_ sender: Any) {
        arrayPersons.append(Person(name: "Username", surname: "Usersurname", imagename: "image"))
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayPersons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath)
            
            // Configure the cell...
            
            let label = cell.viewWithTag(1001) as! UILabel
            label.text = arrayPersons[indexPath.row].name
            
            let labelSurname = cell.viewWithTag(1002) as! UILabel
            labelSurname.text = arrayPersons[indexPath.row].surname

            let imageView = cell.viewWithTag(1003) as! UIImageView
            imageView.image = UIImage(named: arrayPersons[indexPath.row].imagename)

        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath)
        
        // Configure the cell...
        
        let label = cell.viewWithTag(1001) as! UILabel
        label.text = arrayPersons[indexPath.row].name
        
        let labelSurname = cell.viewWithTag(1002) as! UILabel
        labelSurname.text = arrayPersons[indexPath.row].surname

        let imageView = cell.viewWithTag(1003) as! UIImageView
        imageView.image = UIImage(named: arrayPersons[indexPath.row].imagename)

        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        vc.person = arrayPersons[indexPath.row]
        
        
        navigationController?.show(vc, sender: self)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            arrayPersons.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
