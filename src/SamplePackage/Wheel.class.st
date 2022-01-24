"
I'm a numeric class that allows division by zero

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	l:		<Object>
	m:		<Object>


    Implementation Points
"
Class {
	#name : #Wheel,
	#superclass : #Number,
	#instVars : [
		'l',
		'm'
	],
	#category : #SamplePackage
}

{ #category : #constants }
Wheel class >> T [

	"comment stating purpose of class-side method"

	"scope: class-variables  &  class-instance-variables"

	^self numerator: 0 denominator: 0
]

{ #category : #constants }
Wheel class >> inf [

	"comment stating purpose of class-side method"

	"scope: class-variables  &  class-instance-variables"

	^self numerator: 1 denominator: 0
]

{ #category : #'instance creation' }
Wheel class >> new [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	

	^super new numerator: 0 denominator: 0
]

{ #category : #'instance creation' }
Wheel class >> numerator: n denominator: d [

	"comment stating purpose of class-side method"

	"scope: class-variables  &  class-instance-variables"

	^ self new numerator: n denominator: d
]

{ #category : #constants }
Wheel class >> one [

	"comment stating purpose of class-side method"

	"scope: class-variables  &  class-instance-variables"

	^self numerator: 1 denominator: 1
]

{ #category : #constants }
Wheel class >> zero [

	"comment stating purpose of class-side method"

	"scope: class-variables  &  class-instance-variables"

	^self numerator: 0 denominator: 1
]

{ #category : #arithmetic }
Wheel >> * aNumber [ 
	"Answer the result of multiplying the receiver by aNumber."

	^self asFraction * aNumber
]

{ #category : #arithmetic }
Wheel >> + aNumber [ 
	"Answer the sum of the receiver and aNumber."

	^self asFraction + aNumber
]

{ #category : #arithmetic }
Wheel >> - aNumber [ 
	"Answer the difference between the receiver and aNumber."

	^self asFraction - aNumber
]

{ #category : #arithmetic }
Wheel >> / aNumber [ 
	"Answer the result of dividing the receiver by aNumber."

	^Wheel new numerator: l*aNumber denominator: m
]

{ #category : #testing }
Wheel >> < aMagnitude [ 
	"Answer whether the receiver is less than the argument."

	^self asFraction < aMagnitude
]

{ #category : #comparing }
Wheel >> = aMagnitude [ 
	"Compare the receiver with the argument and answer with true if the 
	receiver is equal to the argument. Otherwise answer false."

	^self asFraction = aMagnitude
]

{ #category : #converting }
Wheel >> adaptToFraction: rcvr andSend: selector [
	"If I am involved in arithmetic with a Fraction, convert us and evaluate exprBlock."
	^(rcvr asWheel) perform: selector with: self
]

{ #category : #converting }
Wheel >> adaptToInteger: rcvr andSend: selector [
	"If I am involved in arithmetic with a Integer, convert us and evaluate exprBlock."
	^ (Wheel numerator: rcvr denominator: 1) perform: selector with: self
]

{ #category : #converting }
Wheel >> asFloat [
	"Answer a floating-point number approximating the receiver."

	^self asFraction asFloat
]

{ #category : #converting }
Wheel >> asFraction [

	"comment stating purpose of instance-side method"

	"scope: class-variables  &  instance-variables"

	^ l / m
]

{ #category : #comparing }
Wheel >> hash [
	"Hash must be redefined whenever = is redefined."

	^l hash bitXor: m hash
]

{ #category : #'instance creation' }
Wheel >> numerator: n denominator: d [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	l := n.
	m := d
	
]

{ #category : #printing }
Wheel >> printOn: aStream base: base [
	"This method should print a representation of the number for the given base,
	excluding the base prefix (and the letter r for radix)"
	
	l printOn: aStream base: base.
	aStream nextPut: $/.
	m printOn: aStream base: base
]

{ #category : #'truncation and round off' }
Wheel >> round: numberOfWishedDecimal [
	"Round the decimal part of the receiver to be limited to the number of wished decimal. Only leave a fixed amount of decimal"
   < expr: 10.12345 round: 2 result: 10.12 >
	< expr: 10.199999999 round: 2 result: 10.2 > 
	^self asFloat round: numberOfWishedDecimal
]

{ #category : #printing }
Wheel >> storeOn: aStream base: base [
	"This method should print a representation of the number for the given base,
	including the base prefix (with letter r for radix)"
	
	l storeOn: aStream base: base.
	aStream nextPut: $/.
	m storeOn: aStream base: base
]
