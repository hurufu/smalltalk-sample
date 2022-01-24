Extension { #name : #Number }

{ #category : #'*SamplePackage' }
Number >> asWheel [

	^self subclassResponsibility
]

{ #category : #'*SamplePackage' }
Number >> isWheel [

	"No normal Number is a Wheel"

	^false
]
