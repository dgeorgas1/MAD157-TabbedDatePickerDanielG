//
//  PlanViewController.swift
//  TabbedDatePicker
//
//  Created by student on 2/25/24.
//

import UIKit

class PlanViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var meal: [Item] = []
    var selectedFood = ""
    var datePicker = ""
    var receivedMeal: String? {
            didSet {
                if let item = receivedMeal {
                    selectedFood = String(item.split(separator: "; ")[0])
                    datePicker = String(item.split(separator: "; ")[1])
                    let itemToAdd = Item(title: selectedFood, subtitle: datePicker)
                    meal.append(itemToAdd)
                    if let tableView = tableView {
                        tableView.reloadData()
                    } else {
                    }
                }
            }
        }
    
    @IBOutlet weak var tableView: UITableView!
    
    struct Item {
        var title: String
        var subtitle: String
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meal.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)
        let item = meal[indexPath.row]
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.subtitle
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}
