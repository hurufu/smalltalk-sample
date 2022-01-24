"
A WheelTest is a test class for testing the behavior of Wheel
"
Class {
	#name : #WheelTest,
	#superclass : #TestCase,
	#category : #'SamplePackage-Tests'
}

{ #category : #'basic tests' }
WheelTest >> testCanByConstructed [
	"A fractional wheel object can be created without causing divideTwoByZero error"
	"scope: class-variables  &  instance-variables"	
			
	| tmp |
	tmp := Wheel new numerator: 1 denominator: 0.
	self deny: tmp equals: nil
]

{ #category : #'basic tests' }
WheelTest >> testCanDividyByZero [
	"A fractional wheel object can be created without causing divideTwoByZero error"
	"scope: class-variables  &  instance-variables"	
			
	| a b |
	a := Wheel new numerator: 1 denominator: 1.
	b := Wheel new numerator: 0 denominator: 0.
	self assert: a/b equals: (Wheel new numerator: 1 denominator: 0).
]
