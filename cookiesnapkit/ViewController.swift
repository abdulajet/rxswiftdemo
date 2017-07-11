//
//  ViewController.swift
//  cookiesnapkit
//
//  Created by Abdul Ajetunmobi on 10/07/2017.
//  Copyright © 2017 Abdul Ajetunmobi. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift

class ViewController: UIViewController {
	
	//init variables
	let cookie = UIButton()
	let label = UILabel()
	
	//counter as a RxVariable
	var counter = Variable(0)
	let disposeBag = DisposeBag()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//store superview for convenience
		let superview = self.view!
		
		superview.backgroundColor = UIColor.gray
		
		//set cookie image onto the button
		cookie.setImage(#imageLiteral(resourceName: "cookie"), for: .normal)
		superview.addSubview(cookie)
		
		//snapkit constraints
		cookie.snp.makeConstraints { (make) in
			make.width.equalTo(100)
			make.height.equalTo(100)
			make.center.equalTo(superview)
		}
		
		//add func as target for touches on the button
		cookie.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
		
		//set up the label
		label.font = label.font.withSize(20)
		superview.addSubview(label)
		
		//label contraints
		label.snp.makeConstraints { (make) in
			make.bottom.equalTo(superview.snp.bottom).offset(-200)
			make.centerX.equalTo(superview.snp.centerX)
		}
		
		//subscribe to the button
		counter.asObservable().subscribe{event in
			//on next update the label
			self.label.text = String(self.counter.value)
		}.addDisposableTo(disposeBag)
		
	}
	
	func buttonClicked(){
		//increment counter
		counter.value = counter.value + 1
	}
}

