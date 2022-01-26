Extension { #name : #Float }

{ #category : #'*SamplePackage' }
Float >> asWheel [

	self flag: #todo. "I think I can deduce more information about infinity and return better FractionalWheel like 5/0 and not just always 1/0"

	self isNaN ifTrue: [ ^ FractionalWheel nan ].
   self isInfinite ifTrue: [ 
				self < 0
					ifTrue: [ ^ FractionalWheel numerator: -1 denominator: 0 ]
					ifFalse: [ ^ FractionalWheel inf ] ].

	^ self asFraction asWheel
]
