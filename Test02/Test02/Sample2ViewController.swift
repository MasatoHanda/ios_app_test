//
//  Sample2ViewController.swift
//  Test02
//
//  Created by bss_mobile_dev on 2020/02/09.
//  Copyright © 2020 bss_mobile_dev. All rights reserved.
//

import UIKit
import Charts

class Sample2ViewController: UIViewController {
    
    
    @IBOutlet weak var SleepDurationGraph: CombinedChartView!
    
    @IBOutlet weak var SleepActivityGraph: BarChartView!
    
    @IBOutlet weak var DisplayDurationTab: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
