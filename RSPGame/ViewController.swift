//
//  ViewController.swift
//  RSPGame
//
//  Created by ProCG on 2023/11/09.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var clientImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var clientChoiceLabel: UILabel!
    
    var clientChoice: Rps = Rps.rock
    var comChoice: Rps = Rps(rawValue: Int.random(in: 1...3))!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1) 첫번쨰/두번째 이미지뷰에 준비(묵) 이미지를 띄워야 함.
        comImageView.image = #imageLiteral(resourceName: "ready")
        clientImageView.image = UIImage(named: "ready.png")
        
        // 2) 첫번째/두번째 레이블에 "준비"라고 문자열 표시
        comChoiceLabel.text = "준비"
        clientChoiceLabel.text = "준비"
        
    }

    
    
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        // 가위, 바위, 보를 선택해서 그 정보를 저장
//        guard let title = sender.currentTitle else {
//            return
//        }
        let title = sender.currentTitle!
        switch title {
        case "가위":
            clientChoice = Rps.scissors
        case "바위":
            clientChoice = Rps.rock
        case "보":
            clientChoice = Rps.paper
        default:
            break
        }
        
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        switch comChoice {
        case Rps.rock:
            comImageView.image = #imageLiteral(resourceName: "rock")
            comChoiceLabel.text = "바위"
        case Rps.paper:
            comImageView.image = #imageLiteral(resourceName: "paper")
            comChoiceLabel.text = "보"
        case Rps.scissors:
            comImageView.image = #imageLiteral(resourceName: "scissors")
            comChoiceLabel.text = "가위"
        }
        
        switch clientChoice {
        case Rps.rock:
            clientImageView.image = #imageLiteral(resourceName: "rock")
            clientChoiceLabel.text = "바위"
        case Rps.paper:
            clientImageView.image = #imageLiteral(resourceName: "paper")
            clientChoiceLabel.text = "보"
        case Rps.scissors:
            clientImageView.image = #imageLiteral(resourceName: "scissors")
            clientChoiceLabel.text = "가위"
        }
        
        let result = (comChoice.rawValue - clientChoice.rawValue) % 3
        if result == 0{
            mainLabel.text = "비겼다"
        } else if result == 1 {
            mainLabel.text = "졌다"
        } else {
            mainLabel.text = "이겼다"
        }
    
    
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        comChoice = Rps(rawValue: Int.random(in: 1...3))!
    }
    
}



