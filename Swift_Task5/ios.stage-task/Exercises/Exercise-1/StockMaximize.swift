import Foundation

class StockMaximize {

    func countProfit(prices: [Int]) -> Int {
        var profit = 0
        var purchase = 0
        var count = 0
        let max = prices.max()
        let index = prices.firstIndex{$0 == max}
        var newPrices = [Int]()

        if prices .isEmpty {
            profit = 0
        } else if prices.count >= 1 {
            for i in 0 ..< (prices.count - 1) {
                if prices[i] < prices[i+1] {
                    purchase += prices[i]
                    count += 1
                    if (i+1) > index! {
                        newPrices.append(contentsOf: prices[i+1]...prices.last!)
                        if prices[i+1] == newPrices.max()! {
                            profit += prices[i+1] * count - purchase
                            purchase = 0
                            count = 0
                            newPrices.removeAll()
                        } else if prices[i+1] < prices.max()!{
                            continue
                            }
                        }
                    if (i+1) == index! {
                        profit += prices[i+1] * count - purchase
                        purchase = 0
                        count = 0
                    }
                    }
                if prices[i] == prices[i+1] {
                if (i+1) < index! {
                    purchase += prices[i]
                    count += 1
                }
                if (i+1) == index! {
                    break
                }
            }
            if prices[i] > prices[i+1] {
                if prices[i] == max {
                    profit += prices[i] * count - purchase
                    purchase = 0
                    count = 0
                } else if prices[i] != max {
                    if i < index! {
                        purchase += prices[i]
                        count += 1
                    }
                    if i > index! {
                        profit += prices[i] * count - purchase
                        purchase = 0
                        count = 0
                        }
                    }
                }
            }
        }
        return profit
    }
}
