//
//  ViewController.swift
//  TomatoPregressThreeColors
//
//  Created by Tomato on 2021/10/16.
//

import UIKit
import TomatoProgressThreeColorsFramework

class ViewController: UIViewController {
	// MARK: - Variables
	var progressView = UIView()
	
	
	// MARK: - IBOutlet
	
	
	// MARK: - IBAction
	@IBAction func startTapped(_ sender: UIButton) {
		progressView.frame = view.frame
		let rotateView = TomatoProgressThreeColorsView(frame: view.frame, strokeColor0: UIColor.orange, startDegree0: -120.0, endDegree0: 0.0, strokeColor1: UIColor.purple, startDegree1: 0.0, endDegree1: 120.0, strokeColor2: UIColor.green, startDegree2: 120.0, endDegree2: 240.0, backColor: UIColor.black, radius: 100.0, weight: 30.0, slowness: 2.0, hasAbortButton: true, abortTitle: "Abort", abortButtonHasBorder: true, abortButtonBorderColor: UIColor.clear, abortButtonBorderWidth: 1.0, abortButtonCornerRadius: 8.0, abortButtonSize: CGSize(width: 100.0, height: 30.0), abortBackColor: UIColor.blue, abortTitleNormalColor: UIColor.white, abortTitleHighlightedColor: UIColor.gray)
		progressView.addSubview(rotateView)
		view.addSubview(progressView)
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
			self.progressView.removeFromSuperview()
		}
	}
	
	
	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
	}
}

