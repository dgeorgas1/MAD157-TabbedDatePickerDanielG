//
//  ViewController.swift
//  TabbedDatePicker
//
//  Created by student on 2/25/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var food: [Item] = []
    var selectedFood: String?
    var foodString = ""
    var ingredients = ""
    var receivedFood: String? {
            didSet {
                if let item = receivedFood {
                    foodString = String(item.split(separator: "- Ingredients: ")[0])
                    ingredients = String(item.split(separator: "- Ingredients: ")[1])
                    let itemToAdd = Item(title: foodString, subtitle: ingredients)
                    food.append(itemToAdd)
                    tableView.reloadData()
                }
            }
        }
    let dateFormatter: DateFormatter = DateFormatter()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    struct Item {
        var title: String
        var subtitle: String
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return food.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)
        let item = food[indexPath.row]
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.subtitle
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedCell = tableView.cellForRow(at: indexPath) {
            selectedFood = selectedCell.textLabel?.text
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
    }
    
    @IBAction func addMealBtn(_ sender: UIButton) {
        let selectedDate: String? = dateFormatter.string(from: datePicker.date)
        if let tabBarController = self.tabBarController {
            if let viewControllers = tabBarController.viewControllers {
                if let viewController = viewControllers[2] as? PlanViewController {
                    if let selectedFood = selectedFood, let selectedDate = selectedDate {
                        viewController.receivedMeal = selectedFood + "; \(selectedDate)"
                    }
                }
            }
        }
    }
    
}
