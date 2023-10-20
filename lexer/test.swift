var red, green, blue: Double
        let valueExpected = "SUCCESS"
        let valueProvided = "success"
        
        if valueExpected.caseInsensitiveCompare(valueProvided) == ComparisonResult.orderedSame
        {
            print("Strings are equal")
        }
		
		// let myAge = 32
		let isOld = true
		let number: Int32 = 123
		let binNumber = 0b1010
		let octNumber = 0o12
		let hexNumber = 0xa1
		let dec = 1_1__1
		let oct = 0o1_2
		let hex = 0xa_1
		
		
		let decFNumber = 0.123e2
		let decMFNumber = 0.123e-2
		let hexFNumber = 0x1.4p3
		let decExp = 0.1_2_3e0_2
		let hexExp1 = 0x01.04p03
		let hexExp2 = 0x0_1.0_4p0_3
		

		let x = 2
		let dec_int = 4_2
		let x1 = - 1
		let string = "First day a month: \\(((x)))"
		let string = "First day a month: \""
		
		
		//Arithmetic
		let sum = 2 + 3;
		let difference = 3 - 2
		let product = x * 5
		let quotient = x / 2
		let remainder =  sum % x
		let minus_remainder = -sum % x
		let expr = sum + difference - product
		
		let three = 3
		let minusThree = -three
		let plusThree = -minusThree
		
		let minusSix = -6
		let alsoMinusSix = +minusSix
		
		var a = 1
		a += 2
		
		1 == 1
		2 != 1
		2 > 1
		1 < 2
		1 >= 1
		2 <= 1
		
		let name = "world"
		if name == "world" { 
			print("hello,world!")
		} else {
			print("Sorry")
		}
		
		//Ternary
		let contentHeight = 40 
		let hasHeader = true
		let rowHeight = hasHeader ? 50 : 20

		//Closed range operator
		for index in 1...5 {
			print("success")
		}
		
		//Half-open range operator 
		let names = ["Anna", "Alex", "Brian", "Jack"]
		let count = names.count
		for i in 0..<count { 
			print("Person1")
		}
		
		for name in names[2...] { 
			print(name)
		}
		
		for name in names [...2] {
			print(name)
		}
		
		for name in names [..<2] {
			print(name)
		}
		
		let range = ...5
		
		if !allowedEntry { 
			print("ACCESS DENIED")
		}
		
		let hasDoorKey = false
		let knows = true 
		if hasDoorKey || knows { 
			print("Welcome!")
		}
		
		if hasDoorKey && knows { 
			print("Welcome!")
		}
		
		
		if hasDoorKey || knows && allowedEntry { 
			print("Welcome")
		}

		// String literals
		// One Line String
		let oneLineString = "OneLine String!"
		
		// Multiline String
		let multiLineString = """
		Hello,
		World!
		"""

		// Multiline String with double quotes
		let multiLineStringDoubleQuotes = """
		"Hello,"
		World!
		"""

		// Multiline String with transfers lines
		let multiLineStringTransfersLines = """
		Hello, world! And all \
		lorem ipsum dolor sit amet.
		World!
		"""

		// Multiline String with escaped double quotes
		let multiLineStringEscapedQuotes = """
		\"Hello,\"
		World!
		"""

		// Multiline String with escaped single quotes
		let multiLineStringEscapedQuotes = """
		\'Hello,\'
		World!
		"""

		// Multiline String with escaped backslash
		let multiLineStringEscapedBackslash = """
		\\Hello,
		World!
		"""

		//Multiline String with escaped triple quotes
		let multiLineStringEscapedTripleQuotes = """
		\"\"\"Hello,\"
		lorem ipsum dolor sit \""" amet.
		World!
		"""

		// Multiline String with escaped triple quotes
		let multiLineStringEscapedTripleQuotes = """
		\"\"\"Hello,\"
		lorem ipsum\"\"" dolor sit \""" amet.
		World!
		l"""

		// Comments
		// Single line comment
		
		/* Multiline comment
		let multilineComment = """
		Multiline
		comment
		""" */

		print("HELLO, 



world")

var b = 0b+ 0b1 + 0ba + 0b_1 + 0b12
var x = 0x+ 0x_1 + 0xvv + 0x7x + 0xf
var o = 0o+ 0o1 + 0ov + 0o_1 + 0o78