import UIKit

class ViewController: UIViewController
{

	@IBOutlet weak var activeCalculationLabel: UILabel!
	@IBOutlet weak var resultCalculationLabel: UILabel!
	
	var currentCalculation:String = ""
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		clearAll()
	}
	
	func clearAll()
	{
		currentCalculation = ""
		activeCalculationLabel.text = ""
		resultCalculationLabel.text = ""
	}

	@IBAction func equalsTap(_ sender: Any)
	{
		if(validInput())
		{
			let checkedWorkingsForPercent = currentCalculation.replacingOccurrences(of: "%", with: "*0.01")
			let expression = NSExpression(format: checkedWorkingsForPercent)
			let result = expression.expressionValue(with: nil, context: nil) as! Double
			let resultString = formatResult(result: result)
			resultCalculationLabel.text = resultString
		}
        if(currentCalculation.popLast() == "!"){
           
            let number = Int(currentCalculation)!
            let result = factorial(number)
            resultCalculationLabel.text = String(result)
        }

        
	}
	
	func validInput() ->Bool
	{
		var count = 0
		var funcCharIndexes = [Int]()
		
		for char in currentCalculation
		{
			if(specialCharacter(char: char))
			{
				funcCharIndexes.append(count)
			}
			count += 1
		}
		
		var previous: Int = -1
		
		for index in funcCharIndexes
		{
			if(index == 0)
			{
				return false
			}
			
			if(index == currentCalculation.count - 1)
			{
				return false
			}
			
			if (previous != -1)
			{
				if(index - previous == 1)
				{
					return false
				}
			}
			previous = index
		}
		
		return true
	}
	
	func specialCharacter (char: Character) -> Bool
	{
		if(char == "*")
		{
			return true
		}
		if(char == "/")
		{
			return true
		}
		if(char == "+")
		{
			return true
		}
        if(char == "√"){
            return true
        }
            
        if(char == "!"){
            return true
        }
            
		return false
	}
	
	func formatResult(result: Double) -> String
	{
		if(result.truncatingRemainder(dividingBy: 1) == 0)
		{
			return String(format: "%.0f", result)
		}
		else
		{
			return String(format: "%.2f", result)
		}
	}
	
	@IBAction func allClearTap(_ sender: Any)
	{
		clearAll()
	}
	
	@IBAction func backTap(_ sender: Any)
	{
		if(!currentCalculation.isEmpty)
		{
			currentCalculation.removeLast()
			activeCalculationLabel.text = currentCalculation
		}
	}
	
	func addCurrentCalculation(value: String)
	{
		currentCalculation = currentCalculation + value
		activeCalculationLabel.text = currentCalculation
	}
	
	@IBAction func percentTap(_ sender: Any)
	{
		addCurrentCalculation(value: "%")
	}
	
	@IBAction func divideTap(_ sender: Any)
	{
		addCurrentCalculation(value: "/")
	}
	
	@IBAction func timesTap(_ sender: Any)
	{
		addCurrentCalculation(value: "*")
	}
	
	@IBAction func minusTap(_ sender: Any)
	{
		addCurrentCalculation(value: "-")
	}
	
	@IBAction func plusTap(_ sender: Any)
	{
		addCurrentCalculation(value: "+")
	}
	
	@IBAction func decimalTap(_ sender: Any)
	{
		addCurrentCalculation(value: ".")
	}
	
	@IBAction func zeroTap(_ sender: Any)
	{
		addCurrentCalculation(value: "0")
	}
	
	@IBAction func oneTap(_ sender: Any)
	{
		addCurrentCalculation(value: "1")
	}
	
	@IBAction func twoTap(_ sender: Any)
	{
		addCurrentCalculation(value: "2")
	}
	
	@IBAction func threeTap(_ sender: Any)
	{
		addCurrentCalculation(value: "3")
	}
	
	@IBAction func fourTap(_ sender: Any)
	{
		addCurrentCalculation(value: "4")
	}
	
	@IBAction func fiveTap(_ sender: Any)
	{
		addCurrentCalculation(value: "5")
	}
	
	@IBAction func sixTap(_ sender: Any)
	{
		addCurrentCalculation(value: "6")
	}
	
	@IBAction func sevenTap(_ sender: Any)
	{
		addCurrentCalculation(value: "7")
	}
	
	@IBAction func eightTap(_ sender: Any)
	{
		addCurrentCalculation(value: "8")
	}
	
	@IBAction func nineTap(_ sender: Any)
	{
		addCurrentCalculation(value: "9")
	}
    
   
    @IBAction func factorialTap(_ sender: Any) {
        addCurrentCalculation(value: "!")
        
    }
    
    func factorial(_ n: Int) -> Double {
      return (1...n).map(Double.init).reduce(1.0, *)
    }
}

