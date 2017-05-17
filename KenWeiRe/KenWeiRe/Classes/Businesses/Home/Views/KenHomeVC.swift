//
//  KenHomeVC.swift
//  SwiftTest
//
//  Created by Ken.Liu on 2017/4/28.
//  Copyright © 2017年 Ken.Liu. All rights reserved.
//

import UIKit

class KenHomeVC: UIViewController {
    
    let recorder = KenRecorder()
    
    private let recorderBtn: UIButton = {
        let recorderBtn = UIButton(type: .custom)
        recorderBtn.frame = CGRect(x: 0, y: 0, width: 80, height: 50)
        recorderBtn.setTitle("开始录音", for: .normal)
        recorderBtn.setTitleColor(UIColor.appMainColor, for: .normal)
        recorderBtn.titleLabel?.font = UIFont.appFont(18)
        recorderBtn.addTarget(self, action: #selector(recorderBtnClicked), for: .touchUpInside)
        recorderBtn.backgroundColor = UIColor.clear
        
        return recorderBtn
    }()
    
    private let playBtn: UIButton = {
        let playBtn = UIButton(type: .custom)
        playBtn.frame = CGRect(x: 0, y: 0, width: 80, height: 50)
        playBtn.setTitle("播放录音", for: .normal)
        playBtn.setTitleColor(UIColor.appMainColor, for: .normal)
        playBtn.titleLabel?.font = UIFont.appFont(18)
        playBtn.addTarget(self, action: #selector(playBtnClicked), for: .touchUpInside)
        playBtn.backgroundColor = UIColor.clear
        
        return playBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recorderBtn.left = 10
        recorderBtn.top = 100
        self.contentView.addSubview(recorderBtn)
        
        playBtn.left = recorderBtn.right + 10
        playBtn.top = recorderBtn.top
        self.contentView.addSubview(playBtn)
    }
    
    func recorderBtnClicked() {
        if recorder.isRecording() {
            recorder.stopRecorder()
        } else {
            recorder.startRecorder()
        }
    }
    
    func playBtnClicked() {
        recorder.playRecorderFile()
    }
}
