//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport
import AVFoundation



let cfURL = Bundle.main.url(forResource: "Itim-Regular", withExtension: "ttf")! as CFURL
CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)

let cfURL2 = Bundle.main.url(forResource: "Raleway-Regular", withExtension: "ttf")! as CFURL
CTFontManagerRegisterFontsForURL(cfURL2, CTFontManagerScope.process, nil)

let cfURL3 = Bundle.main.url(forResource: "Raleway-Bold", withExtension: "ttf")! as CFURL
CTFontManagerRegisterFontsForURL(cfURL3, CTFontManagerScope.process, nil)

//for family in UIFont.familyNames {
//    print("\(family)")
//    for name in UIFont.fontNames(forFamilyName: family) {
//        print("   \(name)")
//    }
//}


class MainScreenViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        let backgroundImage = UIImageView()
        backgroundImage.contentMode = .scaleToFill
        backgroundImage.frame = CGRect(x: 0, y: 420, width: 1366, height: 603.5)
        backgroundImage.image = UIImage(imageLiteralResourceName: "Background.png")
        
        let musikidsLabel = UILabel()
        let font = UIFont(name: "Itim", size: 80)
        musikidsLabel.frame = CGRect(x: 531, y: 70, width: 304, height: 100)
        musikidsLabel.text = "Musikids"
        musikidsLabel.textColor = .black
        musikidsLabel.font = font
        
        let botaoRitmo = UIImage (named: "BOTAO RITMO.png")
        let botaoMelodia = UIImage (named: "BOTAO MELODIA.png")
        let botaoHarmonia = UIImage(named: "BOTAO HARMONIA.png")
        
        let jogarRitmoButton = UIButton()
        jogarRitmoButton.frame = CGRect(x: 81.39, y: 200, width: 415.61, height: 445)
        jogarRitmoButton.setTitle("RITMO", for: .normal)
        jogarRitmoButton.setTitleColor(.black, for: .normal)
        jogarRitmoButton.setImage(botaoRitmo, for: .normal)
        jogarRitmoButton.addTarget(nil, action: #selector(tapRitmoButton), for: .touchUpInside)
        jogarRitmoButton.isUserInteractionEnabled = true
        let tapRitmo = UITapGestureRecognizer(target: self, action: #selector(tapRitmoButton))
        jogarRitmoButton.addGestureRecognizer(tapRitmo)
        
        let jogarMelodiaButton = UIButton()
        jogarMelodiaButton.frame = CGRect(x: 869, y: 200, width: 415.61, height: 445)
        jogarMelodiaButton.setTitle("MELODIA", for: .normal)
        jogarMelodiaButton.setTitleColor(.black, for: .normal)
        jogarMelodiaButton.setImage(botaoMelodia, for: .normal)
        
        let jogarHarmoniaButton = UIButton()
        jogarHarmoniaButton.frame = CGRect(x: 475.195, y: 550, width: 415.61, height: 445)
        jogarHarmoniaButton.setTitle("HARMONIA", for: .normal)
        jogarHarmoniaButton.setTitleColor(.black, for: .normal)
        jogarHarmoniaButton.setImage(botaoHarmonia, for: .normal)
        
        view.addSubview(backgroundImage)
        view.addSubview(musikidsLabel)
        view.addSubview(jogarRitmoButton)
        view.addSubview(jogarMelodiaButton)
        view.addSubview(jogarHarmoniaButton)
        
        self.view = view
        
        navigationController?.navigationBar.isHidden = true
    }
    
    @objc func tapRitmoButton(_ gesture: UIGestureRecognizer) {
        //print("Apertou botão de RITMO")
        navigationController?.pushViewController(ritmoScreenOne, animated: false)
    }
}

class RitmoScreenOneViewController: UIViewController {
    
    private var audioPlayer: AVAudioPlayer?
    
    
    
    var botaoProximo: UIButton!
    var botaoJogar: UIButton!
    var screenButton: UIButton!
    
    var labelRitmo2: UILabel!
    
    var card1: UIImageView!
    var card2: UIImageView!
    var card3: UIImageView!
    var card4: UIImageView!
    
    var card1azul: UIImageView!
    var card2azul: UIImageView!
    var card3azul: UIImageView!
    var card4azul: UIImageView!
    
    var numberOfRepeats = 0
    var count: Double!
    
    var timer: Timer!
    var timerIsOn: Bool?
    var rightBeat: Bool?
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        
        
        
        self.view = view
        
        navigationController?.navigationBar.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            audioPlayer = AVAudioPlayer()
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Musikids Exercício Ritmo 1", ofType: "mp3")!))
            audioPlayer?.prepareToPlay()
        }
        catch {
            
            print(error)
        }
        
        
        let botaoRetornarImage = UIImage(named: "BotaoRetornar.png")
        let botaoProximoImage = UIImage(named: "BotaoProximo.png")
        let botaoJogarImage = UIImage(named: "BotaoJogar.png")
        
        
        
        let botaoRetornar = UIButton()
        botaoRetornar.frame = CGRect(x: 30, y: 30, width: 126, height: 126)
        botaoRetornar.setImage(botaoRetornarImage, for: .normal)
        botaoRetornar.addTarget(nil, action: #selector(tapBotaoRetornar), for: .touchUpInside)
        botaoRetornar.isUserInteractionEnabled = true
        let tapRetornar = UITapGestureRecognizer(target: self, action: #selector(tapBotaoRetornar))
        botaoRetornar.addGestureRecognizer(tapRetornar)
        
        
        
        botaoProximo = UIButton()
        botaoProximo.frame = CGRect(x: 598.985, y: 472.5, width: 168.03, height: 79)
        botaoProximo.setImage(botaoProximoImage, for: .normal)
        botaoProximo.addTarget(nil, action: #selector(tapBotaoProximo), for: .touchUpInside)
        botaoProximo.isHidden = false
        botaoProximo.isUserInteractionEnabled = true
        let tapProximo = UITapGestureRecognizer(target: self, action: #selector(tapBotaoProximo))
        botaoProximo.addGestureRecognizer(tapProximo)
        
        
        
        botaoJogar = UIButton()
        botaoJogar.frame = CGRect(x: 598.985, y: 472.5, width: 168.03, height: 79)
        botaoJogar.setImage(botaoJogarImage, for: .normal)
        botaoJogar.addTarget(nil, action: #selector(tapBotaoJogar), for: .touchUpInside)
        botaoJogar.isHidden = true
        botaoJogar.isUserInteractionEnabled = true
        let tapJogar = UITapGestureRecognizer(target: self, action: #selector(tapBotaoJogar))
        botaoJogar.addGestureRecognizer(tapJogar)
        
        
        
        screenButton = UIButton()
        screenButton.frame = CGRect(x: 0, y: 0, width: 1366, height: 1024)
        screenButton.addTarget(nil, action: #selector(tapScreen), for: .touchUpInside)
        screenButton.isUserInteractionEnabled = true
        let tapTela = UITapGestureRecognizer(target: self, action: #selector(tapScreen))
        screenButton.addGestureRecognizer(tapTela)
        
        
        
        let ritmoTitleLabel = UILabel()
        ritmoTitleLabel.frame = CGRect(x: 533, y: 30, width: 300, height: 100)
        ritmoTitleLabel.text = "RITMO"
        ritmoTitleLabel.textColor = .black
        let font = UIFont(name: "Raleway-Regular", size: 80)
        ritmoTitleLabel.font = font
        
        let boldAttribute = [
            NSAttributedString.Key.font: UIFont(name: "Raleway-Bold", size: 28)!
        ]
        let regularAttribute = [
            NSAttributedString.Key.font: UIFont(name: "Raleway-Regular", size: 28)!
        ]
        let boldText = NSAttributedString(string: "duração", attributes: boldAttribute)
        let boldText2 = NSAttributedString(string: "ritmo.", attributes: boldAttribute)
        let regularText = NSAttributedString(string: "Na música, o ritmo está ligado à ", attributes: regularAttribute)
        let regularText2 = NSAttributedString(string: " de um som. Ou seja, por quanto tempo aquele som é tocado. Sons podem ser curtos ou longos, e combinando diferentes durações, nós temos o ", attributes: regularAttribute)
        let newString1 = NSMutableAttributedString()
        newString1.append(regularText)
        newString1.append(boldText)
        newString1.append(regularText2)
        newString1.append(boldText2)
        
        
        
        let regularText3 = NSAttributedString(string: "Quando contamos de 1 até 4, sempre seguimos um ", attributes: regularAttribute)
        let regularText4 = NSAttributedString(string: " Vamos tentar? Os números irão mudar de cor dentro de um ritmo. Sempre que um número mudar de cor, toque na tela!", attributes: regularAttribute)
        let newString2 = NSMutableAttributedString()
        newString2.append(regularText3)
        newString2.append(boldText2)
        newString2.append(regularText4)
        
        
        
        let labelRitmo1 = UILabel()
        labelRitmo1.frame = CGRect(x: 183, y: 100, width: 1000, height: 200)
        labelRitmo1.attributedText = newString1
        labelRitmo1.numberOfLines = 3
        labelRitmo1.textAlignment = .center
        
        
        
        labelRitmo2 = UILabel()
        labelRitmo2.frame = CGRect(x: 183, y: 250, width: 1000, height: 200)
        labelRitmo2.attributedText = newString2
        labelRitmo2.numberOfLines = 3
        labelRitmo2.textAlignment = .center
        labelRitmo2.isHidden = true
        
        
        
        let backgroundImage = UIImageView()
        backgroundImage.contentMode = .scaleToFill
        backgroundImage.frame = CGRect(x: 0, y: 420, width: 1366, height: 603.5)
        backgroundImage.image = UIImage(imageLiteralResourceName: "Background.png")
        
        
        
        card1 = UIImageView()
        card1.contentMode = .scaleToFill
        card1.frame = CGRect(x: 183, y: 650, width: 215, height: 215)
        card1.image = UIImage(imageLiteralResourceName: "card1.png")
        card1.isHidden = true
        
        card1azul = UIImageView()
        card1azul.contentMode = .scaleToFill
        card1azul.frame = CGRect(x: 183, y: 650, width: 215, height: 215)
        card1azul.image = UIImage(imageLiteralResourceName: "card1azul.png")
        card1azul.isHidden = true
        
        card2 = UIImageView()
        card2.contentMode = .scaleToFill
        card2.frame = CGRect(x: 444.66, y: 650, width: 215, height: 215)
        card2.image = UIImage(imageLiteralResourceName: "card2.png")
        card2.isHidden = true
        
        card2azul = UIImageView()
        card2azul.contentMode = .scaleToFill
        card2azul.frame = CGRect(x: 444.66, y: 650, width: 215, height: 215)
        card2azul.image = UIImage(imageLiteralResourceName: "card2azul.png")
        card2azul.isHidden = true
        
        card3 = UIImageView()
        card3.contentMode = .scaleToFill
        card3.frame = CGRect(x: 706.32, y: 650, width: 215, height: 215)
        card3.image = UIImage(imageLiteralResourceName: "card3.png")
        card3.isHidden = true
        
        card3azul = UIImageView()
        card3azul.contentMode = .scaleToFill
        card3azul.frame = CGRect(x: 706.32, y: 650, width: 215, height: 215)
        card3azul.image = UIImage(imageLiteralResourceName: "card3azul.png")
        card3azul.isHidden = true
        
        card4 = UIImageView()
        card4.contentMode = .scaleToFill
        card4.frame = CGRect(x: 968, y: 650, width: 215, height: 215)
        card4.image = UIImage(imageLiteralResourceName: "card4.png")
        card4.isHidden = true
        
        card4azul = UIImageView()
        card4azul.contentMode = .scaleToFill
        card4azul.frame = CGRect(x: 968, y: 650, width: 215, height: 215)
        card4azul.image = UIImage(imageLiteralResourceName: "card4azul.png")
        card4azul.isHidden = true
        
        view.addSubview(backgroundImage)
        view.addSubview(screenButton)
        view.addSubview(botaoRetornar)
        view.addSubview(ritmoTitleLabel)
        view.addSubview(labelRitmo1)
        view.addSubview(labelRitmo2)
        view.addSubview(card1)
        view.addSubview(card1azul)
        view.addSubview(card2)
        view.addSubview(card2azul)
        view.addSubview(card3)
        view.addSubview(card3azul)
        view.addSubview(card4)
        view.addSubview(card4azul)
        view.addSubview(botaoProximo)
        view.addSubview(botaoJogar)
    }
    
    @objc func tapBotaoRetornar(_ gesture: UIGestureRecognizer) {
        //        print("Apertou botão de RETORNO")
        
        if timerIsOn == true {
            navigationController?.popToRootViewController(animated: false)
            labelRitmo2.isHidden = true
            card1.isHidden = true
            card2.isHidden = true
            card3.isHidden = true
            card4.isHidden = true
            card1azul.isHidden = true
            card2azul.isHidden = true
            card3azul.isHidden = true
            card4azul.isHidden = true
            botaoProximo.isHidden = false
            botaoJogar.isHidden = true
            
            timer.invalidate()
            timer = nil
            audioPlayer?.stop()
            timerIsOn = false
        }
            
        else {
            navigationController?.popToRootViewController(animated: false)
            labelRitmo2.isHidden = true
            card1.isHidden = true
            card2.isHidden = true
            card3.isHidden = true
            card4.isHidden = true
            card1azul.isHidden = true
            card2azul.isHidden = true
            card3azul.isHidden = true
            card4azul.isHidden = true
            botaoProximo.isHidden = false
            botaoJogar.isHidden = true
        }
    }
    
    
    @objc func tapScreen(_ gesture: UIGestureRecognizer) {
        print("Tocou na tela")
        
//        if (card1azul.isHidden == false || card2azul.isHidden == false || card3azul.isHidden == false || card4azul.isHidden == false) {
//
//            print("Tocou no tempo certo")
//
//        }
//
//        else {
//
//            print("Tocou errado")
//        }

    }
    
    @objc func tapBotaoProximo(_ gesture: UIGestureRecognizer) {
        print("Clicou em 'Próximo'")
        
        labelRitmo2.frame = CGRect(x: 183, y: 250, width: 1000, height: 200)
        labelRitmo2.isHidden = false
        labelRitmo2.textColor = .black
        labelRitmo2.backgroundColor = .white
        card1.isHidden = false
        card2.isHidden = false
        card3.isHidden = false
        card4.isHidden = false
        botaoProximo.isHidden = true
        botaoJogar.isHidden = false
        timerIsOn = false
        
    }
    
    @objc func tapBotaoJogar(_ gesture: UIGestureRecognizer) {
        print("Clicou em 'Jogar'")
        botaoJogar.isHidden = true
        
        
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(incrementCountLabel), userInfo: nil, repeats: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.audioPlayer?.play()
            
            
        }
        timerIsOn = true
        count = 0
        numberOfRepeats = 0
        
        card1azul.isHidden = true
        card1.isHidden = false
        
        audioPlayer?.currentTime = 0
        
        
    }
    
    @objc func incrementCountLabel() {
        
        count += 1
        
        switch count {
            
        case 4:
//            rightBeat = true
//            card4.isHidden = true
            card4azul.isHidden = false
//            card1.isHidden = false
            card1azul.isHidden = true
//            card2.isHidden = false
            card2azul.isHidden = true
//            card3.isHidden = false
            card3azul.isHidden = true
            
//            print("Tempo 4")
            
            count = 0
            numberOfRepeats += 1
            
            
            
        case 1:
//            rightBeat = true
//            card1.isHidden = true
            card1azul.isHidden = false
//            card2.isHidden = false
            card2azul.isHidden = true
//            card3.isHidden = false
            card3azul.isHidden = true
//            card4.isHidden = false
            card4azul.isHidden = true
            
//            print("Tempo 1")
            
            
        case 2:
//            rightBeat = true

//            card1.isHidden = false
            card1azul.isHidden = true
//            card2.isHidden = true
            card2azul.isHidden = false
//            card3.isHidden = false
            card3azul.isHidden = true
//            card4.isHidden = false
            card4azul.isHidden = true
//            print("Tempo 2")
            
            
            
        case 3:
//            rightBeat = true

//            card1.isHidden = false
            card1azul.isHidden = true
//            card2.isHidden = false
            card2azul.isHidden = true
//            card3.isHidden = true
            card3azul.isHidden = false
//            card4.isHidden = false
            card4azul.isHidden = true
//            print("Tempo 3")
        
//        case 0.75, 1.75, 2.75, 3.75:
//
//            rightBeat = true
//
//        case 0.25, 1.25, 2.25, 3.25:
//
//            rightBeat = false
//
//        case 0.5, 1.5, 2.5, 3.5:
//
//            print("Contra-tempo")
//            rightBeat = false
            
        default:
             
        ()
            
        }
        
        if (numberOfRepeats == 4 && count == 1) {
            
            timer.invalidate()
            
            self.botaoJogar.isHidden = false
            self.card1.isHidden = false
            self.card1azul.isHidden = true
            timerIsOn = false
            //            audioPlayer?.stop()
            
            
        }
    }
}


// Present the view controller in the Live View window

let mainScreen = MainScreenViewController()
let ritmoScreenOne = RitmoScreenOneViewController()
let navigation = UINavigationController(screenType: .ipadPro12_9, isPortrait: false)
navigation.pushViewController(mainScreen, animated: false)

let msvc = MainScreenViewController(screenType: .ipadPro12_9, isPortrait: false)
msvc.preferredContentSize = CGSize(width: 1024, height: 1366)
//PlaygroundPage.current.liveView = msvc.scale(to: 0.4)

PlaygroundPage.current.liveView = navigation.scale(to: 0.4)


