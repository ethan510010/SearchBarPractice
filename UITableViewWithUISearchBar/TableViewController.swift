//
//  TableViewController.swift
//  UITableViewWithUISearchBar
//
//  Created by EthanLin on 2018/1/8.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UISearchResultsUpdating{
    
    
    //實作UISearchResultUpdationg的方法
    func updateSearchResults(for searchController: UISearchController) {
        //使用者輸入要查詢的
        if let searchWord = searchController.searchBar.text{
            resultArray = fruitArray.filter({ (filterFruit) -> Bool in
                if filterFruit.lowercased().contains(searchWord.lowercased()){
                    return true
                }else{
                    return false
                }
            })
            //讓顯示結果的tableView去reloadData
            self.searchResultsController.tableView.reloadData()
        }
    }
    
    
    
    let fruitArray = ["apple","banana","pineapple","orange","peach","cherry","mango"]
    
    //創建一個陣列存搜尋的結果
    var resultArray = [String]()
    
    let searchResultsController = UITableViewController()
    var searchController:UISearchController?

    override func viewDidLoad() {
        super.viewDidLoad()

        //建立搜尋列但還沒有搜尋的功能
        searchController = UISearchController(searchResultsController: searchResultsController)
        
        tableView.tableHeaderView = searchController?.searchBar
        
        //實作有搜尋功能
        searchController?.searchResultsUpdater = self
        searchResultsController.tableView.dataSource = self
        searchResultsController.tableView.delegate = self
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
        if tableView == self.tableView{
             return fruitArray.count
        }else{
            return resultArray.count
        }
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if tableView == self.tableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = fruitArray[indexPath.row]
            return cell
        }else{
            let cell = UITableViewCell()
            cell.textLabel?.text = resultArray[indexPath.row]
            return cell
        }
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
