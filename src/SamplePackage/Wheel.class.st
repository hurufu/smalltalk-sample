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

{ #category : #'instance creation' }
Wheel class >> new [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	

	^super new numerator: 0 denominator: 0
]

{ #category : #'instance creation' }
Wheel >> numerator: n denominator: d [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	l := n.
	m := d
	
]
