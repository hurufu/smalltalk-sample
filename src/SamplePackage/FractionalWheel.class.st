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

	| a |
	a := aNumber asWheel.
	^(self class
		     numerator: numerator * a numerator
		     denominator: denominator * a denominator ) asFractionWhenPossible
]

{ #category : #arithmetic }
FractionalWheel >> + aNumber [

	| a |
	a := aNumber asWheel.
	^ (self class
		   numerator:
		   numerator * a denominator + (a numerator * denominator)
		   denominator: denominator * a denominator) asFractionWhenPossible
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

{ #category : #private }
FractionalWheel >> asFractionWhenPossible [

	(denominator = 0) | (numerator = 0)
		ifTrue: [ ^ self ]
		ifFalse: [ ^ super reduced ]
]

{ #category : #converting }
FractionalWheel >> asWheel [

	^self
]

{ #category : #private }
FractionalWheel >> denominator: aNumber [

	"I keep negative number always in the numerator"

	| tmp |
	tmp := aNumber asInteger.
	tmp < 0 ifTrue: [ 
		tmp := tmp negated.
		numerator := numerator negated ].
	denominator := tmp
]

{ #category : #comparing }
FractionalWheel >> hash [

	"My most close relative is Fraction class, that's why I try to have the same hash value whenever it's possible (ie. when I don't divide by zero), otherwise I use custom hash formula from Point class because it has the same structure: pair of numbers."

	super denominator = 0
		ifTrue: [ ^ (super numerator @ super denominator) hash ]
		ifFalse: [ ^ super hash ]
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

	"Print a representation excluding the base prefix (and the letter r for radix) of the number.
	Format is rather verbose with an approximate floating point value for debugging purpose."

	super numerator printOn: aStream base: base.
	aStream nextPut: $/.
	super denominator printOn: aStream base: base.
	aStream
		nextPut: Character space;
		nextPut: $(.
	self asFloat printOn: aStream base: base.
	aStream nextPut: $)
]
