//
//  KenRecorder.swift
//  KenWeiRe
//
//  Created by Ken.Liu on 2017/5/17.
//  Copyright © 2017年 Ken.Liu. All rights reserved.
//

import UIKit
import AVFoundation

class KenRecorder {
    var recorder:AVAudioRecorder?               //录音器
    var player:AVAudioPlayer?                   //播放器
    var recorderSeetingsDic:[String : Any]?     //录音器设置参数数组
    var volumeTimer:Timer!                      //定时器线程，循环监测录音的音量大小
    var aacPath:String?                         //录音存储路径
    
    func initSession() {
        if recorderSeetingsDic == nil {
            //初始化录音器
            let session:AVAudioSession = AVAudioSession.sharedInstance()
            
            //设置录音类型
            try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
            //设置支持后台
            try! session.setActive(true)

            //初始化字典并添加设置参数
            recorderSeetingsDic =
                [
                    AVFormatIDKey: NSNumber(value: kAudioFormatMPEG4AAC),
                    AVNumberOfChannelsKey: 2, //录音的声道数，立体声为双声道
                    AVEncoderAudioQualityKey : AVAudioQuality.max.rawValue,
                    AVEncoderBitRateKey : 320000,
                    AVSampleRateKey : 44100.0 //录音器每秒采集的录音样本数
            ]
        }
        
        //获取Document目录
        let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                         .userDomainMask, true)[0]
        //组合录音文件路径
        aacPath = docDir + "/play.aac"
    }
    
    func startRecorder() {
        if recorder?.isRecording == true {
            return
        }
            
        initSession()
        
        //初始化录音器
        recorder = try! AVAudioRecorder(url: URL(string: aacPath!)!,
                                        settings: recorderSeetingsDic!)
        if recorder != nil {
            //开启仪表计数功能
            recorder!.isMeteringEnabled = true
            //准备录音
            recorder!.prepareToRecord()
            //开始录音
            recorder!.record()
        }
    }
    
    func stopRecorder() {
        //停止录音
        recorder?.stop()
        //录音器释放
        recorder = nil
    }
    
    func playRecorderFile(_ path: String = "") {
        var filePath = path
        if filePath.isEmpty {
            filePath = aacPath!
        }
        //播放
        player = try! AVAudioPlayer(contentsOf: URL(string: aacPath!)!)
        if player == nil {
            print("播放失败")
        }else{
            player?.play()
        }
    }
    
    func isRecording() -> Bool {
        if recorder == nil {
            return false
        }
        return (recorder?.isRecording)!
    }
    
    //获取当前音量
    func levelTimer() ->Double {
        recorder!.updateMeters() // 刷新音量数据
//        let averageV:Float = recorder!.averagePower(forChannel: 0)          //获取音量的平均值
        let maxV:Float = recorder!.peakPower(forChannel: 0)                 //获取音量最大值
        let lowPassResult:Double = pow(Double(10), Double(0.05 * maxV))
        
        return lowPassResult
    }
}
