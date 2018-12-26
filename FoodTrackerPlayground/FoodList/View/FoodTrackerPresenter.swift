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

class FoodTrackerPresenter
: NSObject {

	private var foodTrackerView: FoodTrackerView?

	override init() {
		super.init()
	}
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
		foodTrackerView?.setFoodNameLabelText(nameLabelText: "Default Text")
	}
}

