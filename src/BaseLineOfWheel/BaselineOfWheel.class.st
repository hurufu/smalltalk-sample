Class {
	#name : #BaselineOfWheel,
	#superclass : #BaselineOf,
	#category : #BaseLineOfWheel
}

{ #category : #baselines }
BaselineOfWheel class >> baseline: spec [
	<baseline>
			
	spec for: #common do: [ 
		"Packages"
		spec
			package: 'SamplePackage';
			package: 'SamplePackage-Tests' with: [ spec requires: #('SamplePackage') ] ]
]
