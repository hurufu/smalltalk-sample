"
A WheelTest is a test class for testing the behavior of Wheel
"
Class {
	#name : #FractionalWheelTest,
	#superclass : #TestCase,
	#category : #'SamplePackage-Tests'
}

{ #category : #'basic tests' }
FractionalWheelTest >> testCanBeDividedByZero [

	self assert: FractionalWheel one / 0 equals: FractionalWheel inf
]

{ #category : #'basic tests' }
FractionalWheelTest >> testCanByConstructed [

	self deny: FractionalWheel nan equals: nil
]

{ #category : #tests }
FractionalWheelTest >> testFloatIsConvertibleToWheel [

	self assert: 1.0 asWheel equals: FractionalWheel one
]

{ #category : #tests }
FractionalWheelTest >> testFractionIsConvertibleToWheel [
	self
		assert: 1 / 3 asWheel
		equals: (FractionalWheel numerator: 1 denominator: 3)
]

{ #category : #tests }
FractionalWheelTest >> testHandleDivisionByZeroInTheMiddleOfCalculation [

	| tmp res |
	tmp := 3 / 5 asWheel.
	res := tmp + (1 / (tmp / (tmp - tmp))).

	self
		assert: tmp
		equals: (FractionalWheel numerator: 3 denominator: 5).
	self assert: res equals: tmp
]

{ #category : #tests }
FractionalWheelTest >> testLargeIntegerIsConvertibleToWheel [

	| tmp |
	tmp := SmallInteger maxVal * 1.
	self
		assert: tmp asWheel
		equals: (FractionalWheel numerator: tmp denominator: 1)
]

{ #category : #'basic tests' }
FractionalWheelTest >> testNumberZeroCanDividedByWheelOne [

		self assert: 0 / FractionalWheel one equals: FractionalWheel zero
]

{ #category : #tests }
FractionalWheelTest >> testSmallIntegerIsConvertibleToWheel [

	self assert: 1 asWheel equals: FractionalWheel one
]

{ #category : #tests }
FractionalWheelTest >> testWheelIsConvertibleToWheel [

	| tmp |
	tmp := FractionalWheel inf.
	self assert: tmp asWheel equals: tmp
]

{ #category : #'basic tests' }
FractionalWheelTest >> testZeroCanBeDividedByZero [

	self assert: FractionalWheel zero / FractionalWheel zero equals: FractionalWheel nan
]
