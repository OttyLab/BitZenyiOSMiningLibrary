//
//  ViewController.swift
//  BitZenyiOSMiner
//
//  Created by ottylab on 2018/03/25.
//  Copyright © 2018 ottylab. All rights reserved.
//

import UIKit
import BitZenyMiningLibrary

class ViewController: UIViewController {
    private var running = false
    private let defaults = UserDefaults.standard;
    private let LOG_SIZE = 1000
    private var logs: [String] = []

    
    @IBOutlet weak var textFieldServer: UITextField!
    @IBOutlet weak var textFieldUser: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldNThreads: UITextField!
    @IBOutlet weak var buttonDrive: UIButton!
    @IBOutlet weak var switchBenchmark: UISwitch!
    @IBOutlet weak var textViewLog: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        restoreSetting()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onDriveButtonTouched(_ sender: UIButton) {
        let obj = BitZenyMiningLibrary(logCallback: handleMessage)
        if (self.running) {
            obj?.stopMining()
        } else {
            var n_threads = Int32(textFieldNThreads.text ?? "0") ?? 0
            if (switchBenchmark.isOn) {
                obj?.startBenchmark()
            } else {
                obj?.startMining(
                    textFieldServer.text,
                    user:textFieldUser.text,
                    password:textFieldPassword.text,
                    n_threads: n_threads);
            }
        }
        
        changeState(running: !self.running)
        storeSetting()
    }
    
    @IBAction func onTextFieldChanged(_ sender: Any) {
        print("onTextFieldChanged")
        storeSetting()
    }
    
    func handleMessage(log: String?) {
        let output = Utils.rotateStringueue(queue: &logs, maxSize: LOG_SIZE, next: log!)
        textViewLog.text = output
    }

    func changeState(running:Bool) {
        buttonDrive.setTitle(running ? "Stop" : "Start", for:UIControlState.normal)
        disableSetting(running: running)
        self.running = running
    }
    
    func disableSetting(running:Bool) {
        textFieldServer.isEnabled = !running;
        textFieldUser.isEnabled = !running;
        textFieldPassword.isEnabled = !running;
        textFieldNThreads.isEnabled = !running;
        switchBenchmark.isEnabled = !running;
    }

    func storeSetting() {
        defaults.set(textFieldServer.text, forKey: "server")
        defaults.set(textFieldUser.text, forKey: "user")
        defaults.set(textFieldPassword.text, forKey: "password")
        defaults.set(textFieldNThreads.text, forKey: "n_threads")
    }
    
    func restoreSetting() {
        textFieldServer.text = defaults.string(forKey: "server")
        textFieldUser.text = defaults.string(forKey: "user")
        textFieldPassword.text = defaults.string(forKey: "password")
        textFieldNThreads.text = defaults.string(forKey: "n_threads")
    }

}

