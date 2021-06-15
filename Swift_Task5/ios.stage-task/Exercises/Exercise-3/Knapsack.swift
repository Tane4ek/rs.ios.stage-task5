import Foundation

public typealias Supply = (weight: Int, value: Int)

public final class Knapsack {
    let maxWeight: Int
    let drinks: [Supply]
    let foods: [Supply]
    var maxKilometers: Int {
        findMaxKilometres()
    }
    
    init(_ maxWeight: Int, _ foods: [Supply], _ drinks: [Supply]) {
        self.maxWeight = maxWeight
        self.drinks = drinks
        self.foods = foods
    }
    
    func findMaxKilometres() -> Int {
        var knapsackWeight = 0
        var maxKm = 0

        for i in 0..<(foods.count) {
        for j in 0..<(drinks.count) {
            print("food is \(foods[i].weight) drink is \(drinks[j].weight)")
            print("food is \(foods[i].weight)")
            print("drink is \(drinks[j].weight)")
            knapsackWeight = foods[i].weight + drinks[j].weight
            if knapsackWeight == maxWeight {
                if foods[i].value > drinks[i].value {
                    maxKm = drinks[i].value
                } else {
                    maxKm = foods[i].value
                }
            }
        }
    }
    return maxKm
    }
}
