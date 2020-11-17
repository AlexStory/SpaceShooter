extends RigidBody2D
class_name Bullet

var HitEffect := preload("res://Effects/HitEffect.tscn")

func hit_object():
	var main = get_tree().current_scene
	var instance = HitEffect.instance()
	main.call_deferred("add_child", instance)
	instance.global_position = global_position
