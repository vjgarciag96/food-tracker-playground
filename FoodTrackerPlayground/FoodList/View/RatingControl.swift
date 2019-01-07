//
//  RatingControl.swift
//  FoodTrackerPlayground
//
//  Created by vjgarcia on 27/12/2018.
//  Copyright © 2018 vjgarciag96. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {

	// MARK: Properties

	private var ratingButtons = [UIButton]()
	private var rating: Int = 0 {
		didSet {
			updateButtonsSelectionState()
		}
	}

	@IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
		didSet {
			setUpButtons()
		}
	}
	@IBInspectable var starCount: Int = 5 {
		didSet {
			setUpButtons()
		}
	}

	// MARK: Initialization

	override init(frame: CGRect) {
		super.init(frame: frame)
		setUpButtons()
	}

	required init(coder: NSCoder) {
		super.init(coder: coder)
		setUpButtons()
	}
}

// MARK: Actions
extension RatingControl {

	@objc func ratingButtonTapped(button: UIButton) {
		guard let index = ratingButtons.index(of: button) else {
			fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
		}

		let selectedRating = index + 1

		if (selectedRating == rating) {
			rating = 0
		} else {
			rating = selectedRating
		}
	}
}

// MARK: Private Methods

private extension RatingControl {

	func setUpButtons() {
		clearOldButtons()
		createNewButtons()
		updateButtonsSelectionState()
	}

	func clearOldButtons() {
		for button in ratingButtons {
			removeArrangedSubview(button)
			button.removeFromSuperview()
		}
		ratingButtons.removeAll()
	}

	func createNewButtons() {
		for _ in 0..<starCount {
			createNewButton()
		}
	}

	func createNewButton() {
		let button = UIButton()
		
		setButtonImages(button: button)
		setButtonSize(button: button)
		setButtonTapAction(button: button)

		addArrangedSubview(button)

		ratingButtons.append(button)
	}

	func setButtonImages(button: UIButton) {
		let bundle = Bundle(for: type(of: self))
		let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
		let emptyStar = UIImage(named:"emptyStar", in: bundle, compatibleWith: self.traitCollection)
		let highlightedStar = UIImage(named:"highlightedStar", in: bundle, compatibleWith: self.traitCollection)

		button.setImage(emptyStar, for: .normal)
		button.setImage(filledStar, for: .selected)
		button.setImage(highlightedStar, for: .highlighted)
		button.setImage(highlightedStar, for: [.highlighted, .selected])
	}

	func setButtonSize(button: UIButton) {
		button.translatesAutoresizingMaskIntoConstraints = false
		button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
		button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
	}

	func setButtonTapAction(button: UIButton) {
		button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
	}

	func updateButtonsSelectionState() {
		for (index, button) in ratingButtons.enumerated() {
			button.isSelected = index < rating
		}
	}
}

