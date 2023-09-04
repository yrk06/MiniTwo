//
//  NotificationQueue.swift
//  MiniTwo
//
//  Created by Yerik Koslowski on 27/08/23.
//

import Foundation

class NotificationQueue: ObservableObject {
    
    @Published var queue: [any Notification] = []
    @Published var current: any Notification = EmptyNotification()
    
    var timer: Timer!
    
    init() {
        timer = Timer.scheduledTimer(withTimeInterval: 15, repeats: true) {
            _ in
            self.generateRandomNotification()
        }
    }
    
    func generateRandomNotification() {
        let rng = Int.random(in: 0..<100)
        
        if rng < 10 {
            return
        }
        else if rng < 50 {
            push(CallNotification(caller: "0303 0800 \(Int.random(in: 1000...9999))-\(Int.random(in: 1000...9999))"))
        } else {
            let texts = [
            ("","Seus cookies estão prestes a se tornar conscientes. Certifique-se de fornecer um ambiente acolhedor."),
            ("","Os ursinhos de pelúcia em seu armário organizaram uma greve de abraços. Negociações em andamento."),
            ("","As nuvens estão em greve e se recusam a produzir mais chuva. A agricultura de bolhas de sabão está em risco!"),
            ("","As árvores agora estão emitindo WiFi gratuito. A conectividade na floresta nunca foi tão rápida."),
            ("","Os cientistas descobriram que o canto dos patos pode curar insônia. Prepare-se para um novo álbum de meditação com patos cantores."),
            ("","Seu guarda-chuva precisa de uma atualização de software."),
            ("","Seu consumo de chocolate atingiu um recorde mundial. Parabéns!"),
            ("","O assistente virtual de sua casa começou a dar conselhos amorosos. Preparativos para o Dia dos Namorados começaram!"),
            ]
            
            let ctext = texts[rng % texts.count].1
            
            push(TextNotification(timeToDismiss: 8,text: ctext))
        }
    }
    
    func addCurrent(_ notification: any Notification) {
        current = notification
        if current.timeToDismiss > 0 {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: DispatchTime.now().uptimeNanoseconds + UInt64(Int64(current.timeToDismiss) * Int64(1e9)) ) )
            {
                self.dismissCurrent()
            }
        } else {
            current.dismiss = self.dismissCurrent
        }
        
    }
    
    func dismissCurrent() {
        current.dismissed = true
        if queue.count > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.addCurrent(self.queue.removeFirst())
            }
        }
        
        
    }
    
    func push(_ notification: any Notification) {
        if queue.count == 0 && current.dismissed {
            addCurrent(notification)
        } else {
            queue.append(notification)
        }
        
    }
    
}
