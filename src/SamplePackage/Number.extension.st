Extension { #name : #Number }

{ #category : #'*SamplePackage' }
Number >> asWheel [

	^ FractionalWheel numerator: self denominator: 1
]

{ #category : #'*SamplePackage' }
Number >> isWheel [

	"No normal Number is a Wheel"

	^false
]
