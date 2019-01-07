//
//  FoodTrackerPresenter.swift
//  FoodTrackerPlayground
//
//  Created by vjgarcia on 26/12/2018.
//  Copyright © 2018 vjgarciag96. All rights reserved.
//

import Foundation
import UIKit

protocol FoodTrackerView {
	func setFoodNameLabelText(nameLabelText: String)
	func showImagePicker()
	func hideImagePicker()
	func showMealPhoto(mealPhoto: UIImage)
}

class FoodTrackerPresenter {
	
	private var foodTrackerView: FoodTrackerView?

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

	func onMealPhotoTapped() {
		foodTrackerView?.showImagePicker()
	}

	func onImagePickerControllerCanceled() {
		foodTrackerView?.hideImagePicker()
	}

	func onImageSelected(selectedImageInfo: [UIImagePickerController.InfoKey : Any]) {
		guard let selectedImage = selectedImageInfo[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
			fatalError("Expected a dictionary containing an image, but was provided the following: \(selectedImageInfo)")
		}

		foodTrackerView?.showMealPhoto(mealPhoto: selectedImage)
		foodTrackerView?.hideImagePicker()
	}
}

// MARK: Private methods

private extension FoodTrackerPresenter {

	func setFoodNameLabelText(foodNameLabelText: String) {
		foodTrackerView?.setFoodNameLabelText(nameLabelText: foodNameLabelText)
	}
}

