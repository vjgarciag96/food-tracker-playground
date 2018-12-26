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

	// MARK: View Properties

	@IBOutlet weak var mealNameLabel: UILabel!
	@IBOutlet weak var mealNameTextField: UITextField!

	// MARK: View Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
		setUpView()
		initializePresenter()
	}

	// MARK: View Actions

	@IBAction func onSetDefaultMealNameButtonTapped(_ sender: Any) {
		foodTrackerPresenter.onSetDefaultMealNameButtonTapped()
	}

}

// MARK: FoodTrackerView methods

extension FoodTrackerViewController: FoodTrackerView {

	func setFoodNameLabelText(nameLabelText: String) {
		self.mealNameLabel.text = nameLabelText
	}
}

// MARK: UITextViewDelegate methods

extension FoodTrackerViewController: UITextFieldDelegate {

	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}

	func textFieldDidEndEditing(_ textField: UITextField) {
		foodTrackerPresenter.textFieldDidEndEditing(textFieldContent: textField.text)
	}
}

// MARK: Private methods

private extension FoodTrackerViewController {

	func setUpView() {
		mealNameTextField.delegate = self
	}

	func initializePresenter() {
		foodTrackerPresenter.setUpView(foodTrackerView: self)
	}
}





