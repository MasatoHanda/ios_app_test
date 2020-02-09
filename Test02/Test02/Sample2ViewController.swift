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
    
    let SampleAwakeCountData = [0,2,3,1,0,1,0]
    let SampleSleepDurationData = [7.5, 5.9, 5.7, 7.2, 7.8, 6.5, 6.0]
    let SampleSleepActivityData = [4.2, 23.4, 31.7, 8.2, 2.7, 10.1, 15.1]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var AwakeCountDataEntry = [ChartDataEntry]()
        var SleepDurationDataEntry = [BarChartDataEntry]()
        var SleepActivityDataEntry = [BarChartDataEntry]()
        
        for i in 0...2 {
            AwakeCountDataEntry.append(ChartDataEntry(x: Double(i), y: Double(SampleAwakeCountData[i])))
            SleepDurationDataEntry.append(BarChartDataEntry(x: Double(i), y: Double(SampleSleepDurationData[i])))
            SleepActivityDataEntry.append(BarChartDataEntry(x: Double(i), y: Double(SampleSleepActivityData[i])))
        }
        
        let AwakeCountDataSet = LineChartDataSet(entries: AwakeCountDataEntry, label: "中途覚醒回数")
        AwakeCountDataSet.drawValuesEnabled = true
        AwakeCountDataSet.drawCirclesEnabled = false
        AwakeCountDataSet.colors = [UIColor.red]
        AwakeCountDataSet.lineWidth = 3.0
        AwakeCountDataSet.axisDependency = .left
        
        let SleepDurationDataSet = BarChartDataSet(entries: SleepDurationDataEntry, label: "睡眠時間")
        SleepDurationDataSet.drawValuesEnabled = false
        SleepDurationDataSet.colors = [UIColor.blue]
        SleepDurationDataSet.axisDependency = .left
        
        let SleepActivityDataSet = BarChartDataSet(entries: SleepActivityDataEntry, label: "睡眠時活動量")
        SleepDurationDataSet.drawValuesEnabled = false
        SleepDurationDataSet.colors = [UIColor.green]
        SleepDurationDataSet.axisDependency = .left
        
        let SleepDurationGraphLineChartData = LineChartData(dataSet: AwakeCountDataSet)
        let SleepDurationGraphBarChartData = BarChartData(dataSet: SleepDurationDataSet)
        
        let SleepDurationGraphCombinedData = CombinedChartData()
        SleepDurationGraphCombinedData.lineData = SleepDurationGraphLineChartData
        SleepDurationGraphCombinedData.barData = SleepDurationGraphBarChartData
        
        SleepDurationGraph.data = SleepDurationGraphCombinedData
        SleepDurationGraph.rightAxis.enabled = false
        SleepDurationGraph.backgroundColor = .white
        SleepDurationGraph.xAxis.valueFormatter = TimeAxisFormatter()
        SleepDurationGraph.xAxis.labelPosition = .bottom
        SleepDurationGraph.xAxis.drawGridLinesEnabled = false
        SleepDurationGraph.xAxis.labelCount = 3
        SleepDurationGraph.xAxis.spaceMin = 0.5
        SleepDurationGraph.xAxis.spaceMax = 0.5
        SleepDurationGraph.xAxis.yOffset = 0
        SleepDurationGraph.xAxis.labelTextColor = UIColor.black
        SleepDurationGraph.xAxis.axisLineColor = UIColor.white
        SleepDurationGraph.leftAxis.labelCount = 3
        SleepDurationGraph.leftAxis.drawGridLinesEnabled = false
        SleepDurationGraph.leftAxis.calculate(min: 0, max: SleepDurationGraphCombinedData.barData.yMax * 1.25)
        SleepDurationGraph.leftAxis.labelTextColor = UIColor.black
        SleepDurationGraph.leftAxis.axisLineColor = UIColor.white
        SleepDurationGraph.chartDescription?.text = ""
        SleepDurationGraph.doubleTapToZoomEnabled = false
        SleepDurationGraph.pinchZoomEnabled = false
        SleepDurationGraph.scaleXEnabled = false
        SleepDurationGraph.scaleYEnabled = false
        SleepDurationGraph.dragEnabled = false
        SleepDurationGraph.notifyDataSetChanged()
        SleepDurationGraph.highlightPerTapEnabled = false

        SleepDurationGraph.extraTopOffset = 0.0
        SleepDurationGraph.extraLeftOffset = 20.0
        SleepDurationGraph.extraRightOffset = 20.0
        
        
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

//x軸のラベルを設定する
public class TimeAxisFormatter: NSObject, IAxisValueFormatter{
    var DaysTimeAxis = [String]()
    
    override init(){
        super.init()
        DaysTimeAxis = getTimeAxis(type: "days")
    }
    
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        // 0 -> Jan, 1 -> Feb...
        return DaysTimeAxis[Int(value)]
    }
    
    public func getTimeAxis(type: String)->[String]{
        
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "Mdd", options: 0, locale: Locale.current)
        let calendar = Calendar.current
        
        var timeAxis = [String]()
        
        switch(type)
        {
        case "days":
            let today = Date()
            let yesterday = calendar.date(byAdding: .day, value: -1, to: calendar.startOfDay(for: today))
            let dayBeforeYesterday = calendar.date(byAdding: .day, value: -2, to: calendar.startOfDay(for: today))
            timeAxis = [formatter.string(from: dayBeforeYesterday!), formatter.string(from: yesterday!), formatter.string(from: today)]
            break
        default:
            break
        }
        
        return timeAxis
    }
}
