//
//  ViewController.swift
//  FoodTrackerPlayground
//
//  Created by vjgarcia on 26/12/2018.
//  Copyright © 2018 vjgarciag96. All rights reserved.
//

import UIKit

class FoodTrackerViewController: UIViewController {

	let foodTrackerPresenter: FoodTrackerPresenter = DependencyInjectionUtils.provideFoodTrackerPresenter()

	// MARK: Properties

	@IBOutlet weak var mealNameLabel: UILabel!
	@IBOutlet weak var mealNameTextField: UITextField!

	override func viewDidLoad() {
		super.viewDidLoad()
		foodTrackerPresenter.setUpView(foodTrackerView: self)
	}

	// MARK: Actions

	@IBAction func onSetDefaultMealNameButtonTapped(_ sender: Any) {
		foodTrackerPresenter.onSetDefaultMealNameButtonTapped()
	}

}

// MARK: FoodTrackerView protocol

extension FoodTrackerViewController: FoodTrackerView {

	func setFoodNameLabelText(nameLabelText: String) {
		self.mealNameLabel.text = nameLabelText
	}
}





