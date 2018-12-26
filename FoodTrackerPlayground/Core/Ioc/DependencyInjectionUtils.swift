//
//  DependencyInjectionUtils.swift
//  FoodTrackerPlayground
//
//  Created by vjgarcia on 26/12/2018.
//  Copyright © 2018 vjgarciag96. All rights reserved.
//

import Foundation

struct DependencyInjectionUtils {

	static func provideFoodTrackerPresenter() -> FoodTrackerPresenter {
		return FoodTrackerPresenter()
	}
}
