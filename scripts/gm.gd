extends Node


var score=0
@onready var score1: Label = $Score

func add_point():
	score+=1
	print(score)
	score1.text="You Collected "+str(score)+"coins."
