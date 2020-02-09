//
//  ViewController.swift
//  Test02
//
//  Created by bss_mobile_dev on 2020/02/08.
//  Copyright © 2020 bss_mobile_dev. All rights reserved.
//

import UIKit
import Charts

class Sample1ViewController: UIViewController {

    let weight : [Double] = [55.0, 55.4, 55.2]
    @IBOutlet weak var iosChartsFigure: LineChartView!
    {
        didSet{
            //x軸設定
            iosChartsFigure.xAxis.labelPosition = .bottom
            iosChartsFigure.xAxis.labelFont = UIFont.systemFont(ofSize: 11) //x軸のフォントの大きさ
            iosChartsFigure.xAxis.labelCount = Int(2) //x軸に表示するラベルの数
            iosChartsFigure.xAxis.labelTextColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)  //x軸ラベルの色
            iosChartsFigure.xAxis.axisLineColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) //x軸の色
            iosChartsFigure.xAxis.axisLineWidth = CGFloat(1) //x軸の太さ
            iosChartsFigure.xAxis.drawGridLinesEnabled = false //x軸のグリッド表示(今回は表示しない)
            iosChartsFigure.xAxis.valueFormatter = lineChartFormatter() //x軸の仕様
            
            //y軸設定
            iosChartsFigure.rightAxis.enabled = false //右軸(値)の表示
            iosChartsFigure.leftAxis.enabled = true //左軸（値)の表示
            //iosChartsFigure.leftAxis.axisMaximum = 60 //y左軸最大値
            iosChartsFigure.leftAxis.axisMinimum = 0 //y左軸最小値
            iosChartsFigure.leftAxis.labelFont = UIFont.systemFont(ofSize: 11) //y左軸のフォントの大きさ
            iosChartsFigure.leftAxis.labelTextColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) //y軸ラベルの色
            iosChartsFigure.leftAxis.axisLineColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1) //y左軸の色(今回はy軸消すためにBGと同じ色にしている)
            iosChartsFigure.leftAxis.drawAxisLineEnabled = false //y左軸の表示(今回は表示しない)
            iosChartsFigure.leftAxis.labelCount = Int(4) //y軸ラベルの表示数
            iosChartsFigure.leftAxis.drawGridLinesEnabled = true //y軸のグリッド表示(今回は表示する)
            iosChartsFigure.leftAxis.gridColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1) //y軸グリッドの色
            
            //その他UI設定
            iosChartsFigure.noDataFont = UIFont.systemFont(ofSize: 30) //Noデータ時の表示フォント
            iosChartsFigure.noDataTextColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) //Noデータ時の文字色
            iosChartsFigure.noDataText = "Keep Waiting" //Noデータ時に表示する文字
            iosChartsFigure.legend.enabled = false //"■ months"のlegendの表示
            iosChartsFigure.dragDecelerationEnabled = true //指を離してもスクロール続くか
            iosChartsFigure.dragDecelerationFrictionCoef = 0.6 //ドラッグ時の減速スピード(0-1)
            iosChartsFigure.chartDescription?.text = nil //Description(今回はなし)
            iosChartsFigure.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1) //Background Color
            //iosChartsFigure.animate(xAxisDuration: 1.2, yAxisDuration: 1.5, easingOption: .ease)//グラフのアニメーション(秒数で設定)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        drawLineChart(xValArr: lineChartFormatter().months, yValArr: weight)
    }
    
    //グラフ描画部分
    func drawLineChart(xValArr: [String], yValArr: [Double]) {
        
        var yValues : [ChartDataEntry] = [ChartDataEntry]()
        
        for i in 0 ..< xValArr.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: yValArr[i])
            yValues.append(dataEntry) //(ChartDataEntry(x: Double(i), y: dollars1[i]))
        }
        
        let data = LineChartData() //データはで表示設定とデータセットをもつ
        let ds = LineChartDataSet(entries: yValues, label: "Months") //ds means DataSet
        
        ////グラフのUI設定
        //グラフのグラデーション有効化
        let gradientColors = [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor, #colorLiteral(red: 0.2196078449, green: 1, blue: 0.8549019694, alpha: 1).withAlphaComponent(0.3).cgColor] as CFArray // Colors of the gradient
        let colorLocations:[CGFloat] = [0.7, 0.0] // Positioning of the gradient
        let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradientColors, locations: colorLocations) // Gradient Object
        
        ds.fill = Fill.fillWithLinearGradient(gradient!, angle: 90.0) // Set the Gradient
        
        
        //その他UI設定
        ds.lineWidth = 3.0 //線の太さ
        //ds.circleRadius = 0 //プロットの大きさ
        ds.drawCirclesEnabled = false //プロットの表示(今回は表示しない)
        ds.mode = .cubicBezier //曲線にする
        ds.fillAlpha = 0.8 //グラフの透過率(曲線は投下しない)
        ds.drawFilledEnabled = true //グラフ下の部分塗りつぶし
        //ds.fillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) //グラフ塗りつぶし色
        ds.drawValuesEnabled = false //各プロットのラベル表示(今回は表示しない)
        ds.highlightColor = #colorLiteral(red: 1, green: 0.8392156959, blue: 0.9764705896, alpha: 1) //各点を選択した時に表示されるx,yの線
        ds.colors = [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)] //Drawing graph
        ////グラフのUI設定
        
        data.addDataSet(ds)
        
        self.iosChartsFigure.data = data
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

//x軸のラベルを設定する
public class lineChartFormatter: NSObject, IAxisValueFormatter{
    let months: [String]! = ["一昨日", "昨日", "今日"]
    
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        // 0 -> Jan, 1 -> Feb...
        return months[Int(value)]
    }
}

