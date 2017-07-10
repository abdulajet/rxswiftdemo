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
	
	let cookie = UIButton(type: UIButtonType.system)
	let label = UILabel()
	var counter = Variable(0)
	
	override func viewDidLoad() {
		super.viewDidLoad()
		let superview = self.view!
		
		view.backgroundColor = UIColor.gray
		
		cookie.backgroundColor = UIColor.brown
		cookie.setTitle(".", for: .normal)
		superview.addSubview(cookie)
		
		cookie.snp.makeConstraints { (make) in
			make.width.equalTo(50)
			make.height.equalTo(50)
			make.center.equalTo(superview)
		}
		
		cookie.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
		
		label.textColor = UIColor.red
		label.text = "0"
		superview.addSubview(label)
		
		label.snp.makeConstraints { (make) in
			make.bottom.equalTo(superview.snp.bottom).offset(-50)
			make.centerX.equalTo(superview.snp.centerX)
		}
		
		counter.asObservable().subscribe{event in
			self.label.text = String(self.counter.value)
			
		}
		
	}
	
	func buttonClicked(){
		counter.value = counter.value + 1
	}
}

