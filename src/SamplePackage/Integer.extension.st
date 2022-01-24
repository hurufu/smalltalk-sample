Extension { #name : #Integer }

{ #category : #'*SamplePackage' }
Integer >> asWheel [

	^FractionalWheel numerator: self denominator: 1
]
