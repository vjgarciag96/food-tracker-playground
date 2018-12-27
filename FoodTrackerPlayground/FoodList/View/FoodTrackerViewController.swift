//
//  ViewController.swift
//  FoodTrackerPlayground
//
//  Created by vjgarcia on 26/12/2018.
//  Copyright © 2018 vjgarciag96. All rights reserved.
//

import UIKit

class FoodTrackerViewController: UIViewController{

	let foodTrackerPresenter: FoodTrackerPresenter = DependencyInjectionUtils.provideFoodTrackerPresenter()

	let imagePickerController = UIImagePickerController()

	// MARK: View Properties

	@IBOutlet weak var mealNameLabel: UILabel!
	@IBOutlet weak var mealNameTextField: UITextField!
	@IBOutlet weak var mealPhotoImageView: UIImageView!

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

	@IBAction func onMealPhotoTapped(_ sender: UITapGestureRecognizer) {
		foodTrackerPresenter.onMealPhotoTapped()
	}
}

// MARK: FoodTrackerView methods

extension FoodTrackerViewController: FoodTrackerView {

	func setFoodNameLabelText(nameLabelText: String) {
		self.mealNameLabel.text = nameLabelText
	}

	func showImagePicker() {
		present(imagePickerController, animated: true, completion: nil)
	}

	func hideImagePicker() {
		dismiss(animated: true, completion: nil)
	}

	func showMealPhoto(mealPhoto: UIImage) {
		mealPhotoImageView.image = mealPhoto
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

// MARK: UIImagePickerControllerDelegate methods

extension FoodTrackerViewController: UIImagePickerControllerDelegate {

	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		foodTrackerPresenter.onImagePickerControllerCanceled()
	}

	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		foodTrackerPresenter.onImageSelected(selectedImageInfo: info)
	}
}


// MARK: UINavigationControllerDelegate

extension FoodTrackerViewController: UINavigationControllerDelegate {

}


// MARK: Private methods

private extension FoodTrackerViewController {

	func setUpView() {
		setUpMealNameTextField()
		setUpImagePicker()
	}

	func setUpMealNameTextField() {
		mealNameTextField.delegate = self
	}

	func setUpImagePicker() {
		imagePickerController.sourceType = .photoLibrary
		imagePickerController.delegate = self
	}

	func initializePresenter() {
		foodTrackerPresenter.setUpView(foodTrackerView: self)
	}
}





