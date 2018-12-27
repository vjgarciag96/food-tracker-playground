//
//  FoodTrackerPresenter.swift
//  FoodTrackerPlayground
//
//  Created by vjgarcia on 26/12/2018.
//  Copyright © 2018 vjgarciag96. All rights reserved.
//

import Foundation

protocol FoodTrackerView {
	func setFoodNameLabelText(nameLabelText: String)
}

class FoodTrackerPresenter {
	private var foodTrackerView: FoodTrackerView?
}

// MARK: Initialization

extension FoodTrackerPresenter{

	func setUpView(foodTrackerView: FoodTrackerView) {
		self.foodTrackerView = foodTrackerView
	}
}

// MARK: View Delegate

extension FoodTrackerPresenter {

	func onSetDefaultMealNameButtonTapped() {
		setFoodNameLabelText(foodNameLabelText: "Default Text")
	}

	func textFieldDidEndEditing(textFieldContent: String?) {
		guard let foodNameLabelText = textFieldContent else {return}
		setFoodNameLabelText(foodNameLabelText: foodNameLabelText)
	}
}

// MARK: Private methods

private extension FoodTrackerPresenter {

	func setFoodNameLabelText(foodNameLabelText: String) {
		foodTrackerView?.setFoodNameLabelText(nameLabelText: foodNameLabelText)
	}
}

