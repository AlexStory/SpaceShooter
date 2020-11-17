extends Node
class_name GameWorld

var score: int = 0 setget set_score;
onready var score_label := $Score

func _ready():
	pass
	

func set_score(value: int) -> void:
	score = value
	score_label.text = "Score = %d" % score

func _on_enemy_killed():
	self.score += 1
	
