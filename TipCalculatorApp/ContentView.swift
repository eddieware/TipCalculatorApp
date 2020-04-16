//
//  ContentView.swift
//  TipCalculatorApp
//
//  Created by EDUARDO MEJIA on 22/02/20.
//  Copyright © 2020 EDDIEWARE. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var totalCuenta = ""
     @State private var noPersonas = 2
     @State private var porcPropina = 1
     let porcPropinas = [10,15,20,25,0]
    
    var totalPorPersona: Double{
        let nPersonas = Double(noPersonas+2)
        let pPropina = Double(porcPropinas[porcPropina])
        let tCuenta = Double (totalCuenta) ?? 0
        
        let totalPropina = tCuenta * (pPropina/100)
        let granTotal = tCuenta + totalPropina
        let porPersona = granTotal / nPersonas
       
        return porPersona
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    TextField("Total Cuenta: ", text: $totalCuenta)
                        .keyboardType(.decimalPad) //sacar teclado numerico
                    Picker("Numero de personas", selection: $noPersonas){
                        ForEach(2 ..< 100){ index in
                            Text("\(index) personas")
                        }
                    }
                }
                
                Section(header: Text(" ¿Cuanto porcentaje deseas dar?")){
                    Picker("Porcentaje de propina", selection: $porcPropina){
                        ForEach(0 ..< porcPropinas.count){
                            Text("\(self.porcPropinas[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section{
                    //Text("$\(calcular())")
                    Text("$\(totalPorPersona, specifier: "%.2f")")
                }
                
            }.navigationBarTitle("Tip Calculator App")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
