
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
		

		let x = 1
		let string = "First day a month: \\(((x)))"
		let string = "First day a month: \"