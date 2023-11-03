//
//  ViewController.swift
//  View Basics, Hierarchy, Auto Layout
//
//  Created by Indrajeet Patwardhan on 9/7/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var textEdit: UITextField!
    @IBOutlet var slider: UISlider!
    @IBOutlet var mySwitch: UISwitch!
    @IBOutlet var progress: UIProgressView!
    
    var switchIsOn: Bool = false
    
    var textIndex: Int = 0
    var textMemory = [
        "",""
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.progress.progress = self.slider.value
        self.switchIsOn = self.mySwitch.isOn
    }
    
    func printButtonLabel(_ btn:UIButton){
        if let label = btn.titleLabel{
            if let text = label.text{
                print("label text was: \(text)")
            }
            else{
                print("Label text was null")
            }
        }
        else{
            print("Button title label was null")
        }
        
    }
    
    func rememberSwitchPosition(){
        self.switchIsOn = self.mySwitch.isOn
    }
    
    @IBAction func buttonTapped(_ btn:UIButton){
        print("Button tapped!")
        self.printButtonLabel(btn)
        
    }
    
    @IBAction func buttonDragged(_ btn:UIButton){
        print("Button dragged!")
        self.printButtonLabel(btn)
        
    }
    
    @IBAction func segmentedControlChanged(_ c:UISegmentedControl){
        print("segmented control changed")
    }
    
    @IBAction func textFieldChanged(_ t:UITextField){
        if let text = t.text{
            print("Text field changed to: \(text)")
        }
        else{
            print("text changed but was null")
        }
    }
    
    @IBAction func sliderChanged(_ s:UISlider){
        let value = s.value
        print("slider was changed to : \(value)")
        
        if(self.switchIsOn){
            self.progress.progress = value
        }
        else{
            print("Refusing to update the progress bar because the switch is off")
        }
        
    }
    
    @IBAction func switchChanged(_ sw:UISwitch){
        print("Switch changed to: \(sw.isOn)")
        self.rememberSwitchPosition()
    }
    
    func handleSegmentedControlChange(){
//        save existing text
        self.textMemory[self.textIndex] = self.textEdit.text ?? "[none]"
        
//        adjust the text edit's text to match whatever position the segcontrol is in
        self.textIndex = self.segmentedControl.selectedSegmentIndex
        self.textEdit.text = self.textMemory[self.textIndex]
    }

}

