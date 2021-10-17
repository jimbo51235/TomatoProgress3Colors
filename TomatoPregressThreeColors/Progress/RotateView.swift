//
//  RotateView.swift
//  TomatoPregressThreeColors
//
//  Created by Tomato on 2021/10/16.
//

import UIKit

class RotateView: UIView {
	var myView = UIView()
	var abortView = UIView()
	
	let strokeColor0: UIColor
	let startDegree0: CGFloat
	let endDegree0: CGFloat
	
	let strokeColor1: UIColor
	let startDegree1: CGFloat
	let endDegree1: CGFloat
	
	let strokeColor2: UIColor
	let startDegree2: CGFloat
	let endDegree2: CGFloat
	
	let backColor: UIColor
	let rotateSize: CGFloat
	let radius: CGFloat
	let weight: CGFloat
	let slowness: Double
	
	let hasAbortButton: Bool
	let abortTitle: String
	let abortButtonHasBorder: Bool
	let abortButtonBorderColor: UIColor
	let abortButtonBorderWidth: CGFloat
	let abortButtonCornerRadius: CGFloat
	let abortButtonSize: CGSize
	let abortBackColor: UIColor
	let abortTitleNormalColor: UIColor
	let abortTitleHighlightedColor: UIColor
	
	init(frame: CGRect, strokeColor0: UIColor, startDegree0: CGFloat, endDegree0: CGFloat, strokeColor1: UIColor, startDegree1: CGFloat, endDegree1: CGFloat, strokeColor2: UIColor, startDegree2: CGFloat, endDegree2: CGFloat, backColor: UIColor, rotateSize: CGFloat, radius: CGFloat, weight: CGFloat, slowness: Double, hasAbortButton: Bool, abortTitle: String, abortButtonHasBorder: Bool, abortButtonBorderColor: UIColor, abortButtonBorderWidth: CGFloat, abortButtonCornerRadius: CGFloat, abortButtonSize: CGSize, abortBackColor: UIColor, abortTitleNormalColor: UIColor, abortTitleHighlightedColor: UIColor) {
		self.strokeColor0 = strokeColor0
		self.startDegree0 = startDegree0
		self.endDegree0 = endDegree0
		
		self.strokeColor1 = strokeColor1
		self.startDegree1 = startDegree1
		self.endDegree1 = endDegree1
		
		self.strokeColor2 = strokeColor2
		self.startDegree2 = startDegree2
		self.endDegree2 = endDegree2
		
		self.backColor = backColor
		self.rotateSize = rotateSize
		self.radius = radius
		self.weight = weight
		self.slowness = slowness
		self.hasAbortButton = hasAbortButton
		self.abortTitle = abortTitle
		self.abortButtonHasBorder = abortButtonHasBorder
		self.abortButtonBorderColor = abortButtonBorderColor
		self.abortButtonBorderWidth = abortButtonBorderWidth
		self.abortButtonCornerRadius = abortButtonCornerRadius
		self.abortButtonSize = abortButtonSize
		self.abortBackColor = abortBackColor
		self.abortTitleNormalColor = abortTitleNormalColor
		self.abortTitleHighlightedColor = abortTitleHighlightedColor
		
		super.init(frame: frame)
		rotateMe()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func rotateMe() {
		let screenSize = UIScreen.main.bounds.size
		self.frame.size = screenSize
		self.backgroundColor = backColor
		self.accessibilityIdentifier = "rotateView.subView"
		
		let rect = CGRect(x: 0.0, y: 0.0, width: screenSize.width, height: screenSize.height)
		myView = UIView(frame: rect)
		let strokeView0 = StrokeView(frame: rect, strokeColor: strokeColor0, start: degreesToRadians(degree: startDegree0), end: degreesToRadians(degree: endDegree0), radius: radius, weight: weight)
		let strokeView1 = StrokeView(frame: rect, strokeColor: strokeColor1, start: degreesToRadians(degree: startDegree1), end: degreesToRadians(degree: endDegree1), radius: radius, weight: weight)
		let strokeView2 = StrokeView(frame: rect, strokeColor: strokeColor2, start: degreesToRadians(degree: startDegree2), end: degreesToRadians(degree: endDegree2), radius: radius, weight: weight)
		myView.addSubview(strokeView0)
		myView.addSubview(strokeView1)
		myView.addSubview(strokeView2)
		myView.backgroundColor = UIColor.clear
		
		let start = 0.0
		let end = start + 2 * Double.pi
		let dur = slowness as Double
		let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
		rotateAnimation.duration = dur
		rotateAnimation.repeatCount = .infinity
		rotateAnimation.fromValue = start
		rotateAnimation.toValue = end
		//rotateAnimation.removedOnCompletion = true
		rotateAnimation.fillMode = CAMediaTimingFillMode.forwards
		rotateAnimation.autoreverses = false
		rotateAnimation.isCumulative = true
		myView.layer.add(rotateAnimation, forKey: "rotationAnimation")
		addSubview(myView)
		
		if hasAbortButton && isAbortButtonValid() {
			let abortRect = CGRect(x: (myView.frame.width - abortButtonSize.width) / 2.0, y: (myView.frame.height - abortButtonSize.height) / 2.0, width: abortButtonSize.width, height: abortButtonSize.height)
			let abortButton = UIButton(frame: abortRect)
			abortButton.setTitle(abortTitle, for: .normal)
			abortButton.setTitleColor(abortTitleNormalColor, for: .normal)
			abortButton.setTitleColor(abortTitleHighlightedColor, for: .highlighted)
			abortButton.layer.backgroundColor = abortBackColor.cgColor
			abortButton.layer.cornerRadius = abortButtonCornerRadius
			if abortButtonHasBorder {
				abortButton.layer.borderColor = abortButtonBorderColor.cgColor
				abortButton.layer.borderWidth = abortButtonBorderWidth
				abortButton.addTarget(self, action: #selector(stopTapped(_:)), for: .touchUpInside)
				abortView.frame = rect
				abortView.backgroundColor = UIColor.clear
				abortView.addSubview(abortButton)
			}
		}
		
		addSubview(myView)
		addSubview(abortView)
	}
	
	func isAbortButtonValid() -> Bool {
		if !hasAbortButton {
			return true
		} else {
			//var (b0, b1, b2, b3, b4) = (false, false, false, false, false)
			if abortButtonSize.width <= radius * 2.0 - weight * 0.5 {
				return true
			} else {
				return false
			}
		}
	}
	
	@objc func stopTapped(_ sender: UIButton) {
		self.removeFromSuperview()
	}
	
	
	// MARK: - Functions
	func degreesToRadians(degree: CGFloat) -> CGFloat {
		return degree * .pi / 180.0
	}
	
	func radiansToDegrees(degree: CGFloat) -> CGFloat {
		return degree * (180.0 / .pi)
	}
}
