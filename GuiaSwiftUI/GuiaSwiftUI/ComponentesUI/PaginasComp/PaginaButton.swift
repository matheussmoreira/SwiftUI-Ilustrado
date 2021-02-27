//
//  PaginaBotoes.swift
//  GuiaSwiftUI
//
//  Created by Matheus S. Moreira on 25/02/21.
//

import SwiftUI

struct PaginaButton: View {
    let corPagina: Color
    @State private var showNormal = false
    @State private var showSheet = false
    @State private var showFullScreen = false
    
    var body: some View {
        ZStack {
            VStack {
                TituloEmBarra(titulo: "Button", corBarra: corPagina)
                Spacer()
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 10) {
                    Button(action: { showNormal.toggle() }) {
                        BotaoRetangular(nome: "Botões Normais")
                    }
                    .sheet(isPresented: $showNormal) { Botao.ExemploInicial() }
                    
                    Button(action: { showSheet.toggle() }) {
                        BotaoRetangular(nome: "Sheet")
                    }
                    .sheet(isPresented: $showSheet) { Botao.Sheet(mostrarSheet: $showSheet) }
                    
                    Button(action: { showFullScreen.toggle() }) {
                        BotaoRetangular(nome: "Full screen")
                    }
                    .fullScreenCover(isPresented: $showFullScreen) {
                        Botao.FullScreen(fullScreen: $showFullScreen)
                    }
                    
                }.padding()
            }.offset(y: 60)
        }
    }
}

struct LinhaBotao_Previews: PreviewProvider {
    static var previews: some View {
        PaginaButton(corPagina: .blue)
    }
}