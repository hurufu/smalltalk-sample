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
	#name : #FractionalWheel,
	#superclass : #Number,
	#instVars : [
		'l',
		'm'
	],
	#category : #'SamplePackage-Numeric'
}

{ #category : #constants }
FractionalWheel class >> inf [

	"comment stating purpose of class-side method"

	"scope: class-variables  &  class-instance-variables"

	^self numerator: 1 denominator: 0
]

{ #category : #constants }
FractionalWheel class >> nan [

	^ self numerator: 0 denominator: 0
]

{ #category : #'instance creation' }
FractionalWheel class >> numerator: n denominator: d [

	^ self new numerator: n; denominator: d
]

{ #category : #constants }
FractionalWheel class >> one [

	"comment stating purpose of class-side method"

	"scope: class-variables  &  class-instance-variables"

	^self numerator: 1 denominator: 1
]

{ #category : #constants }
FractionalWheel class >> zero [

	"comment stating purpose of class-side method"

	"scope: class-variables  &  class-instance-variables"

	^self numerator: 0 denominator: 1
]

{ #category : #arithmetic }
FractionalWheel >> * aNumber [

	"Answer the result of multiplying the receiver by aNumber."
	|x|
	x := aNumber asWheel.
	^ self class numerator: l * x numerator denominator: m * x denominator
]

{ #category : #arithmetic }
FractionalWheel >> + aNumber [ 
	"Answer the sum of the receiver and aNumber."

	^self asFraction + aNumber
]

{ #category : #arithmetic }
FractionalWheel >> - aNumber [ 
	"Answer the difference between the receiver and aNumber."

	^self asFraction - aNumber
]

{ #category : #arithmetic }
FractionalWheel >> / aNumber [

	"Answer the result of dividing the receiver by aNumber."

	^self* aNumber asWheel reciprocal 
]

{ #category : #testing }
FractionalWheel >> < aMagnitude [ 
	"Answer whether the receiver is less than the argument."

	^self asFraction < aMagnitude
]

{ #category : #comparing }
FractionalWheel >> = aNumber [

	"Compare the receiver with the argument and answer with true if the receiver is equal to the argument. Otherwise answer false."

	aNumber isWheel ifTrue: [ 
		| tmp |
		tmp := aNumber asWheel.
		^ l = tmp numerator & (m = tmp denominator) ] ifFalse: [ ^aNumber = self ]
]

{ #category : #converting }
FractionalWheel >> adaptToFraction: rcvr andSend: selector [
	"If I am involved in arithmetic with a Fraction, convert us and evaluate exprBlock."
	^(rcvr asWheel) perform: selector with: self
]

{ #category : #converting }
FractionalWheel >> adaptToInteger: rcvr andSend: selector [
	"If I am involved in arithmetic with a Integer, convert us and evaluate exprBlock."
	^ (FractionalWheel numerator: rcvr denominator: 1) perform: selector with: self
]

{ #category : #converting }
FractionalWheel >> asFloat [
	"Answer a floating-point number approximating the receiver."

	^self asFraction asFloat
]

{ #category : #converting }
FractionalWheel >> asFraction [

	"I know that if I divide by zero the following message will raise an error, but hey, why did you ask to represent me as a Fraction!"

	^ Fraction numerator: l denominator: m
]

{ #category : #converting }
FractionalWheel >> asWheel [

	^self
]

{ #category : #private }
FractionalWheel >> denominator [

^m
]

{ #category : #private }
FractionalWheel >> denominator: newDenominator [

m := newDenominator
]

{ #category : #comparing }
FractionalWheel >> hash [

	"My most close relative is Fraction class, that's why I try to have the same hash value whenever it's possible (ie. when I don't divide by zero), otherwise I use custom hash formula from Point class because it has the same structure: pair of numbers."

	m = 0
		ifTrue: [ ^ (l@m) hash ]
		ifFalse: [ ^ self asFraction hash ]
]

{ #category : #testing }
FractionalWheel >> isFraction [

	"I'm a fraction only when I don't divide by zero."

	m = 0
		ifTrue: [ ^ false ]
		ifFalse: [ ^ true ]
]

{ #category : #testing }
FractionalWheel >> isWheel [

	^true
]

{ #category : #private }
FractionalWheel >> numerator [

^l
]

{ #category : #private }
FractionalWheel >> numerator: newNumerator [

	l := newNumerator
]

{ #category : #printing }
FractionalWheel >> printOn: aStream base: base [

	"This method should print a representation of the number for the given base,
	excluding the base prefix (and the letter r for radix)"

	l printOn: aStream base: base.
	aStream nextPut: $|.
	m printOn: aStream base: base.
	aStream
		nextPut: Character space;
		nextPut: $(.
	m = 0
		ifTrue: [ l = 0 ifTrue: [aStream nextPutAll: 'nan'] ifFalse: [ aStream nextPutAll: 'inf' ] ]
		ifFalse: [ self asFloat printOn: aStream base: base ].
	aStream nextPut: $)
]

{ #category : #arithmetic }
FractionalWheel >> reciprocal [

	"((0/2 asWheel) reciprocal) >>> (2/0 asWheel)"

	^ self class numerator: m denominator: l
]

{ #category : #'truncation and round off' }
FractionalWheel >> round: numberOfWishedDecimal [
	"Round the decimal part of the receiver to be limited to the number of wished decimal. Only leave a fixed amount of decimal"
   < expr: 10.12345 round: 2 result: 10.12 >
	< expr: 10.199999999 round: 2 result: 10.2 > 
	^self asFloat round: numberOfWishedDecimal
]

{ #category : #printing }
FractionalWheel >> storeOn: aStream base: base [

	"This method should print a representation of the number for the given base,
	including the base prefix (with letter r for radix)"

	l storeOn: aStream base: base.
	aStream nextPut: $|.
	m storeOn: aStream base: base
]
