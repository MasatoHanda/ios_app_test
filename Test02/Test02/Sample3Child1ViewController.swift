//
//  Sample3Child1ViewController.swift
//  Test02
//
//  Created by bss_mobile_dev on 2020/02/10.
//  Copyright © 2020 bss_mobile_dev. All rights reserved.
//

import UIKit

class Sample3Child1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Sample3Child1ViewController will appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Sample3Child1ViewController will disappear")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
