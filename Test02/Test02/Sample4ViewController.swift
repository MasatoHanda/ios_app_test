//
//  Sample4ViewController.swift
//  Test02
//
//  Created by 半田雅人 on 2020/02/12.
//  Copyright © 2020 bss_mobile_dev. All rights reserved.
//

import UIKit

class Sample4ViewController: UIViewController {
    
    
    @IBOutlet var ContainerView: UIView!
    @IBOutlet weak var OrangeView: UIView!
    @IBOutlet weak var BlueView: UIView!
    var containers: Array<UIView> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containers = [OrangeView, BlueView]
        ContainerView.bringSubviewToFront(OrangeView)

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func changeContainerView(_ sender: UISegmentedControl) {
        let currentContainerView = containers[sender.selectedSegmentIndex]
        ContainerView.bringSubviewToFront(currentContainerView)
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
