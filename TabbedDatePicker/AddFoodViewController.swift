//
//  AddFoodViewController.swift
//  TabbedDatePicker
//
//  Created by student on 2/25/24.
//

import UIKit

class AddFoodViewController: UIViewController {
    var foodDetailsArray: [String] = []
    var food: [String] = []
    
    var foodName = ""
    var prepTime = ""
    var cookingTemp = ""
    var ingredients = ""
    
    @IBOutlet weak var foodNameTF: UITextField!
    @IBOutlet weak var prepTimeTF: UITextField!
    @IBOutlet weak var cookingTempTF: UITextField!
    @IBOutlet weak var ingredientsTV: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addFoodBtn(_ sender: UIButton) {
        foodName = foodNameTF.text!
        prepTime = prepTimeTF.text!
        cookingTemp = cookingTempTF.text!
        ingredients = ingredientsTV.text!
        
        foodDetailsArray.append(foodName)
        foodDetailsArray.append(prepTime)
        foodDetailsArray.append(cookingTemp)
        foodDetailsArray.append(ingredients)
        
        foodNameTF.text = ""
        prepTimeTF.text = ""
        cookingTempTF.text = ""
        ingredientsTV.text = ""
        
        var foodDetails = ""
        var count = 0
        
        for item in foodDetailsArray {
            if count == 3 {
                foodDetails += "Ingredients: \(item)"
            }
            else {
                foodDetails += "\(item) - "
            }
            count += 1
        }
        
        foodDetailsArray = []
        
        if let tabBarController = self.tabBarController {
            if let viewControllers = tabBarController.viewControllers {
                if let viewController = viewControllers[0] as? ViewController {
                    viewController.receivedFood = foodDetails
                }
            }
        }
    }
}
