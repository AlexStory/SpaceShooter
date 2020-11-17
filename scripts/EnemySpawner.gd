extends Node2D

const Enemy := preload("res://actors/Enemy.tscn")
onready var spawn_points := $SpawnPoints

func get_spawn_point() -> Position2D:
	var points = spawn_points.get_children()
	points.shuffle()
	return points[0].global_position
	

func spawn_enemy() -> void:
	var enemy = Enemy.instance()
	var main = get_tree().current_scene
	main.add_child(enemy)
	enemy.global_position = get_spawn_point()


func _on_Timer_timeout() -> void:
	spawn_enemy()
