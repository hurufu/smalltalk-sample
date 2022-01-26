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
	#superclass : #Fraction,
	#category : #'SamplePackage-Numbers'
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
FractionalWheel class >> new [

	self error: 'Fractional wheels should only be created or converted explicitly'
]

{ #category : #'instance creation' }
FractionalWheel class >> numerator: n denominator: d [

	^ self basicNew
		  numerator: n;
		  denominator: d
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

	| tmp |
	tmp := aNumber asWheel.
	^self class numerator: numerator * tmp numerator denominator: denominator * tmp denominator 
]

{ #category : #arithmetic }
FractionalWheel >> + aNumber [

	| a b |
	a := aNumber asWheel.
	b := FractionalWheel
		     numerator:
		     numerator * a denominator + (a numerator * denominator)
		     denominator: denominator * a denominator.
	b denominator = 0
		ifTrue: [ ^ b ]
		ifFalse: [ ^ b asFraction reduced ]
]

{ #category : #arithmetic }
FractionalWheel >> - aNumber [

	"Answer the difference between the receiver and aNumber."

	^ self + aNumber negated
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

	aNumber isWheel
		ifTrue: [ 
			| tmp |
			tmp := aNumber asWheel.
			^ super numerator = tmp numerator & (super denominator = tmp denominator) ]
		ifFalse: [ ^ aNumber = self ]
]

{ #category : #converting }
FractionalWheel >> adaptToFraction: rcvr andSend: selector [

	"If I am involved in arithmetic with a Fraction, convert us and evaluate exprBlock."

	denominator = 0 ifTrue: [ ^self error: 'Not implemented' ] ifFalse: [ ^rcvr perform: selector with: numerator / denominator ]
]

{ #category : #converting }
FractionalWheel >> asFloat [

	denominator = 0
		ifTrue: [ 
			^Float perform: (numerator
					 compareWith: 0
					 ifLesser: [ #negativeInfinity ]
					 ifEqual: [ #nan ]
					 ifGreater: [ #infinity ]) ]
		ifFalse: [ ^ super asFloat ]
]

{ #category : #converting }
FractionalWheel >> asWheel [

	^self
]

{ #category : #private }
FractionalWheel >> denominator: aNumber [

	denominator := aNumber asInteger
]

{ #category : #comparing }
FractionalWheel >> hash [

	"My most close relative is Fraction class, that's why I try to have the same hash value whenever it's possible (ie. when I don't divide by zero), otherwise I use custom hash formula from Point class because it has the same structure: pair of numbers."

	super denominator = 0
		ifTrue: [ ^ (super numerator @ super denominator) hash ]
		ifFalse: [ ^ self asFraction hash ]
]

{ #category : #testing }
FractionalWheel >> isFraction [

	^true
]

{ #category : #testing }
FractionalWheel >> isWheel [

	^true
]

{ #category : #private }
FractionalWheel >> numerator: aNumber [

	numerator := aNumber asInteger
]

{ #category : #printing }
FractionalWheel >> printOn: aStream base: base [

	"This method should print a representation of the number for the given base,
	excluding the base prefix (and the letter r for radix)"

	super numerator printOn: aStream base: base.
	aStream nextPut: $|.
	super denominator printOn: aStream base: base.
	aStream
		nextPut: Character space;
		nextPut: $(.
	super denominator = 0
		ifTrue: [ 
			super numerator = 0
				ifTrue: [ aStream nextPutAll: 'nan' ]
				ifFalse: [ aStream nextPutAll: 'inf' ] ]
		ifFalse: [ self asFloat printOn: aStream base: base ].
	aStream nextPut: $)
]

{ #category : #arithmetic }
FractionalWheel >> reciprocal [

	"((0/2 asWheel) reciprocal) >>> (2/0 asWheel)"

	^ self class
		  numerator: super denominator
		  denominator: super numerator
]

{ #category : #printing }
FractionalWheel >> storeOn: aStream base: base [

	"This method should print a representation of the number for the given base,
	including the base prefix (with letter r for radix)"

	super numerator storeOn: aStream base: base.
	aStream nextPut: $|.
	super denominator storeOn: aStream base: base
]
