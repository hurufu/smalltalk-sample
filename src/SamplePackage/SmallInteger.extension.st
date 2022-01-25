Extension { #name : #SmallInteger }

{ #category : #'*SamplePackage' }
SmallInteger >> / aNumber [

	"Primitive. This primitive (for /) divides the receiver by the argument
	and returns the result if the division is exact. Fail if the result is not a
	whole integer. Fail if the argument is 0 or is not a SmallInteger. Optional.
	No Lookup. See Object documentation whatIsAPrimitive."

	<primitive: 10>
	aNumber = 0 ifTrue: [ ^FractionalWheel numerator: self denominator: 0 ].

	"This ugly type checking is needed because the implementation in the superclass assumes that the argument is a LargeInteger.
	So, it is using a primitive message that is only in LargeInteger. 
	Using the implementation in the superclass when we have a SmallInteger will fail the primitive and use the slow code.
	At the end it is creating the same Fraction that is done here.
	These duplication has to be avoided by correctly implementing the decision by using double dispatch."

	^ (aNumber isMemberOf: SmallInteger)
		  ifTrue: [ (Fraction numerator: self denominator: aNumber) reduced ]
		  ifFalse: [ super / aNumber ]
]
