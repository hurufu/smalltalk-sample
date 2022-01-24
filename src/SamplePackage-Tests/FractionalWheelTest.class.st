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

	self assert: FractionalWheel one / 0 equals: FractionalWheel zero
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
FractionalWheelTest >> testIntegerIsConvertibleToWheel [

	self assert: 0 asWheel equals: FractionalWheel zero
]