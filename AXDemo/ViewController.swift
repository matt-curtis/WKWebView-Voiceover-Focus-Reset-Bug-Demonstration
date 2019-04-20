//
//  ViewController.swift
//  AXDemo
//
//  Created by Matt Curtis on 4/19/19.
//  Copyright © 2019 Matt Curtis. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UIScrollViewDelegate {

	//	MARK: - Properties

	//	MARK: Views
	
	let labelOne = UILabel()
	
	let labelTwo = UILabel()


	//	MARK: - View Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
		
		labelOne.text = "one"
		labelOne.backgroundColor = UIColor(white: 0.9, alpha: 1)
		
		view.addSubview(labelOne)
		
		labelTwo.text = "two"
		labelTwo.backgroundColor = UIColor(white: 0.9, alpha: 1)
		
		view.addSubview(labelTwo)
		
		DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(6)) {
			let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
	
			webView.isAccessibilityElement = false
			webView.accessibilityElementsHidden = true

			self.view.addSubview(webView)

			webView.loadHTMLString("test", baseURL: nil)
		}
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		labelOne.frame = CGRect(
			x: 0, y: view.bounds.height / 2 - 100,
			width: 100, height: 100
		)
		
		labelTwo.frame = CGRect(
			x: view.bounds.width - 100, y: view.bounds.height / 2 - 100,
			width: 100, height: 100
		)
	}

}

