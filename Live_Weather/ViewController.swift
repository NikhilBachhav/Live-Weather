//
//  ViewController.swift
//  Live_Weather
//
//  Created by Nikhil Ajay Bachhav on 7/24/16.
//  Copyright © 2016 Nikhil Ajay Bachhav_18479. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WeatherServiceDelegate {
    
    let weatherService = WeatherService()
    
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBAction func setCityTapped(sender: UIButton) {
    print ("City Button Tapped")
        openCityAlert()
    }

    func openCityAlert() {
    
        
    let alert = UIAlertController(title: "City", message: "Enter city name", preferredStyle: UIAlertControllerStyle.Alert)
        
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
       
        alert.addAction(cancel)
        
        let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (action: UIAlertAction) -> Void in
            print("OK")
            let textField = alert.textFields?[0]
            print(textField?.text!)
            self.cityLabel.text = textField?.text!
            let cityName = textField?.text
            self.weatherService.getWeather(cityName!)
        }
        alert.addAction(ok)
        
        
        alert.addTextFieldWithConfigurationHandler { (textField: UITextField) -> Void in
            textField.placeholder = ("City Name")
        }
        
        
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    func setWeather(weather: Weather) {
        print("Set Weather ")
        print("City: \(weather.cityName) temp:\(weather.temp) description:\(weather.description)")
        cityLabel.text = weather.cityName
        tempLabel.text = "\(weather.temp)"
        descriptionLabel.text = weather.description
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    self.weatherService.deleagte = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

