"
A WheelTest is a test class for testing the behavior of Wheel
"
Class {
	#name : #FractionalWheelTest,
	#superclass : #TestCase,
	#category : #'SamplePackage-Tests'
}

{ #category : #'tests - conversions' }
FractionalWheelTest >> testAsFloat [

	self assert: FractionalWheel inf asFloat equals: Float infinity.
	self assert: (-5 / 0) asFloat equals: Float negativeInfinity
]

{ #category : #'tests - basic' }
FractionalWheelTest >> testCanBeConstructedByPrototype [

	self
		assert: FractionalWheel nan
		equals: (FractionalWheel numerator: 0 denominator: 0).
	self
		assert: FractionalWheel zero
		equals: (FractionalWheel numerator: 0 denominator: 1).
	self
		assert: FractionalWheel inf
		equals: (FractionalWheel numerator: 1 denominator: 0).
	self
		assert: FractionalWheel one
		equals: (FractionalWheel numerator: 1 denominator: 1)
]

{ #category : #'tests - arithmetic' }
FractionalWheelTest >> testCanBeDividedByZero [

	self assert: 1 / 0 equals: FractionalWheel inf
]

{ #category : #'tests - basic' }
FractionalWheelTest >> testCanBeExplicitlyConstructed [

	self deny: (FractionalWheel numerator: 2 denominator: 0) equals: nil
]

{ #category : #'tests - arithmetic' }
FractionalWheelTest >> testCanComputeReciprocalOfZero [

	self assert: (0 asWheel / 2) reciprocal equals: 2 asWheel / 0
]

{ #category : #'tests - object' }
FractionalWheelTest >> testDivisionProducesExpectedObjects [

	self assert: (2 / 1) class equals: SmallInteger.
	self assert: (1 / 2) class equals: Fraction.
	self assert: (2 / 0) class equals: FractionalWheel.
	self assert: (FractionalWheel zero / 2) class equals: FractionalWheel.
]

{ #category : #'tests - conversions' }
FractionalWheelTest >> testFloatIsConvertibleToWheel [

	self assert: 1.0 asWheel equals: FractionalWheel one.
	self assert: -0.0 asWheel equals: FractionalWheel zero.
	self assert: Float infinity asWheel equals: FractionalWheel inf.
	self
		assert: Float negativeInfinity asWheel
		equals: (FractionalWheel numerator: -1 denominator: 0).
		"Compared to Float nan, FractionalWheel nan is well behaved and can be compared to itself"
	self assert: Float nan asWheel equals: FractionalWheel nan
]

{ #category : #'tests - conversions' }
FractionalWheelTest >> testFractionIsConvertibleToWheel [
	self
		assert: 1 / 3 asWheel
		equals: (FractionalWheel numerator: 1 denominator: 3)
]

{ #category : #'tests - arithmetic' }
FractionalWheelTest >> testHandleArithmeticExpression [

	self assert: 1 + (1/(1 / (1 - 1))) equals: 1
]

{ #category : #'tests - arithmetic' }
FractionalWheelTest >> testHandleDivisionByZeroInTheMiddleOfCalculation [

	| tmp res |
	tmp := (3 / 5) asWheel.
	res := tmp + (1 / (tmp / (tmp - tmp))).

	self
		assert: tmp
		equals: (FractionalWheel numerator: 3 denominator: 5).
	self assert: res equals: tmp
]

{ #category : #'tests - basic' }
FractionalWheelTest >> testHash [

	self deny: (1/0) hash equals: (2/0) hash
]

{ #category : #'tests - conversions' }
FractionalWheelTest >> testLargeIntegerIsConvertibleToWheel [

	| tmp |
	tmp := SmallInteger minVal - 1.
	self
		assert: tmp asWheel
		equals: (FractionalWheel numerator: tmp denominator: 1)
]

{ #category : #'tests - arithmetic' }
FractionalWheelTest >> testNumberZeroCanDividedByWheelOne [

	self assert: 0 / FractionalWheel one equals: 0
]

{ #category : #'tests - conversions' }
FractionalWheelTest >> testOrderOfWheelArgumentsDoesntMatter [

	self assert: 2 asWheel / 0 equals: 2 / 0 asWheel
]

{ #category : #'tests - basic' }
FractionalWheelTest >> testShouldNotBeDefaultConstructible [

	self should: [FractionalWheel new] raise: Error
]

{ #category : #'tests - conversions' }
FractionalWheelTest >> testSmallIntegerIsConvertibleToWheel [

	self assert: 1 asWheel equals: FractionalWheel one
]

{ #category : #'tests - arithmetic' }
FractionalWheelTest >> testSumIsProperlyCalclulated [

	self skip.
	self flags: #todo. "I don't really know how force FractionalWheel when doing (2 * (1 / 0))."
	self assert: 4 + (1 / (1 / 0 * 2)) equals: 4.
	self assert: 4 + (1 / (2 * (1 / 0))) equals: 4
]

{ #category : #'tests - conversions' }
FractionalWheelTest >> testWheelIsConvertibleToWheel [

	| tmp |
	tmp := FractionalWheel inf.
	self assert: tmp asWheel equals: tmp
]

{ #category : #'tests - arithmetic' }
FractionalWheelTest >> testWheelOneCanBeDividedByZero [

	self assert: FractionalWheel one / 0 equals: FractionalWheel inf
]

{ #category : #'tests - conversions' }
FractionalWheelTest >> testWheelsCanBeComparedToOtherWheels [

	self flag: #todo. "I have to verify the white paper if wheels are even comparable in all cases"
	self skip.
	self assert: 2 / 0 < (100 / 0)
]

{ #category : #'tests - arithmetic' }
FractionalWheelTest >> testZeroCanBeDividedByZero [

	self assert: FractionalWheel zero / FractionalWheel zero equals: FractionalWheel nan
]

{ #category : #'tests - object' }
FractionalWheelTest >> testZeroDividedByAnIntegerProducesAFractionalWheel [

	self flag: #todo. "I'm afraid there is no easy way to return instance of FractionalWheel from expression (0/2)"
	self skip.
	self assert: (0 / 2) class equals: FractionalWheel
]
