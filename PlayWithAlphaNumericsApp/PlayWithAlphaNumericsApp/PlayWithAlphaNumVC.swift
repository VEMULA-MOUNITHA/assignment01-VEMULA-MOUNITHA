//
//  PlayWithAlphaNumVC.swift
//  PlayWithAlphaNumericsApp
//
//  Created by Mounitha Vemula on 9/10/23.
//

import UIKit

class PlayWithAlphaNumVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Disable all UI elements initially except for UISwitches and Reset button
        self.headerLBL.text = String(format: "%@\nPlay with AlphaNumerics™️" , "\u{0c38}\u{0c4d}\u{0c35}\u{0c3e}\u{0c17}\u{0c24}\u{0c02}")
        
        
        self.firstStrTF.isEnabled = false
        self.secondStrTF.isEnabled = false
        self.messageTV.isEditable = false
        self.firstNumLBL.text = "0"
        self.secondNumLBL.text = "0"
        for b in numbersStepper{
            b.isEnabled = false
        }
        for a in stringAndPatternBTN{
            a.isEnabled = false
        }
        for c in optionsSWCH{
            c.isOn = false
        }
      
        
        
    }
    
    @IBOutlet weak var headerLBL: UILabel!
    
    
    @IBOutlet weak var firstNumLBL: UILabel!
    
    
    @IBOutlet weak var secondNumLBL: UILabel!
    
    @IBAction func numberSWCH(_ sender: UISwitch) {
        for a in optionsSWCH {
            if a.tag == 0 && a.isOn == true{
                for b in numbersStepper{
                    b.isEnabled = true
                }
                for c in stringAndPatternBTN{
                    if c.tag == 0 {
                        c.isEnabled = true
                    }
                }
            }
            if a.tag == 0 && a.isOn==false{
                firstNumLBL.text = "0"
                secondNumLBL.text = "0"
                messageTV.text = ""
                messageTV.isEditable = false
                for b in numbersStepper{
                    b.isEnabled = false
                }
                for c in stringAndPatternBTN{
                    if c.tag == 0 {
                        c.isEnabled = false
                    }
                }
            }
        }
    }
    
    
    @IBOutlet weak var firstStrTF: UITextField!
    
    @IBOutlet weak var secondStrTF: UITextField!
    
    
    @IBAction func stringSWCH(_ sender: UISwitch) {
        for a in optionsSWCH{
            if a.tag == 1 && a.isOn == true{
                firstStrTF.isEnabled = true
                secondStrTF.isEnabled = true
                for c in stringAndPatternBTN{
                    if c.tag == 1 {
                        c.isEnabled = true
                    }
                }
            }
            if a.tag == 1 && a.isOn==false{
                firstStrTF.text = ""
                secondStrTF.text = ""
                messageTV.text = ""
                messageTV.isEditable = false
                firstStrTF.isEnabled = false
                secondStrTF.isEnabled = false
                for c in stringAndPatternBTN{
                    if c.tag == 1 {
                        c.isEnabled = false
                    }
                }
            }
        }
    }
    
    @IBAction func firstNumStepper(_ sender: UIStepper) {
        for b in numbersStepper{
            if b.tag == 0{
                self.firstNumLBL.text = "\(Int(b.value))"
            }
        }
    }
    
    @IBOutlet var numbersStepper: [UIStepper]!
    
    @IBAction func secondNumStepper(_ sender: UIStepper) {
        for b in numbersStepper{
            if b.tag == 1{
                self.secondNumLBL.text = "\(Int(b.value))"
            }
        }
    }
    
    @IBOutlet weak var messageTV: UITextView!
    
    
    @IBAction func generatePattern(_ sender: UIButton) {
        
        let a = Int(firstNumLBL.text!)
        let b = Int(secondNumLBL.text!)
        let st1 = "❄️"
        let st2 = "🎅"
        let st3 = "🎄"
        if(a==0){
            self.messageTV.text = "First number is invalid. Please provide a value greater than zero."
        }
        else if(b==0){
            self.messageTV.text = "Second number is invalid. Please provide a value greater than zero."
        }
        else{
            self.messageTV.text = ""
            for i in 1...(a ?? 0)!{
                for j in 1...(b ?? 0){
                    if(i==1 || i==a){
                        //print(st1, terminator: "")
                        messageTV.text = messageTV.text+st1
                    }
                    else if(j==1||j==b){
                        //print(st1, terminator: "" )
                        messageTV.text = messageTV.text+st1
                    }
                    else if((i+j)%2==0){
                        //print(st2, terminator: "")
                        messageTV.text = messageTV.text+st2
                    }
                    else{
                        //print(st3, terminator: "")
                        messageTV.text = messageTV.text+st3
                    }
                }
                messageTV.text = messageTV.text+"\n"
            }
        }
    }
    
    
    @IBOutlet var stringAndPatternBTN: [UIButton]!
    
    
    @IBAction func manipulateStrings(_ sender: UIButton) {
        let a = (firstStrTF.text)!
        let b = (secondStrTF.text)!
        let c = a+b
        var ct = 0
        var vr = 0
        let unq = Set(c).count
        let reverse = c.reversed()
        if(a.isEmpty){
            messageTV.text = "First string value is invalid. Please provide at least one character."
        }
        else if(b.isEmpty){
            messageTV.text = "Second string value is invalid. Please provide at least one character."
        }
        else{
            for i in c{
                if(i=="a"||i=="A"||i=="e"||i=="E"||i=="i"||i=="I"||i=="o"||i=="O"||i=="u"||i=="U"){
                    ct = ct+1
                }
                else{
                    vr = vr+1
                }
            }
            messageTV.isEditable = true
            messageTV.text = """
        Concatenation of two strings results in \"\(c).\"
        Number of vowels in \"\(c)\" is \(ct).
        Number of consonants in \"\(c)\" is \(vr).
        Number of unique characters in \"\(c)\" is \(unq).
        The reversal of \"\(c)\" results in \"\(String(reverse)).\"
        """
        }
    }
    
    @IBAction func onReset(_ sender: UIButton) {
        self.firstStrTF.text=""
        self.secondStrTF.text=""
        self.firstStrTF.isEnabled = false
        self.secondStrTF.isEnabled = false
        self.messageTV.text = ""
        self.messageTV.isEditable = false
        self.firstNumLBL.text = "0"
        self.secondNumLBL.text = "0"
        for b in numbersStepper{
            b.isEnabled = false
        }
        for a in stringAndPatternBTN{
            a.isEnabled = false
        }
        for c in optionsSWCH{
            c.isOn = false
        }
        
    }
    
    @IBOutlet var optionsSWCH: [UISwitch]!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
