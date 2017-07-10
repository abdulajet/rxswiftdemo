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
		
	}
	
	func buttonClicked(){
		counter.value = counter.value + 1
		print(counter.value)
	}
}

