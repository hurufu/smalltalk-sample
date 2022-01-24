"
A WheelTest is a test class for testing the behavior of Wheel
"
Class {
	#name : #WheelTest,
	#superclass : #TestCase,
	#category : #'SamplePackage-Tests'
}

{ #category : #'basic tests' }
WheelTest >> testCanBeDividedByZero [

	"comment stating purpose of instance-side method"

	"scope: class-variables  &  instance-variables"

	self assert: (Wheel one) / 0 equals: (Wheel zero)
]

{ #category : #'basic tests' }
WheelTest >> testCanByConstructed [
	"A fractional wheel object can be created without causing divideTwoByZero error"
	"scope: class-variables  &  instance-variables"	
			
	| tmp |
	tmp := Wheel new numerator: 1 denominator: 0.
	self deny: tmp equals: nil
]
