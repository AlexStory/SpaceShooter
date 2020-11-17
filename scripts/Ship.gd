extends Area2D

const Bullet := preload("res://actors/Bullet.tscn")
const ExplosionEffect := preload("res://Effects/ExplosionEffect.tscn")

export(int) var speed := 100
onready var fire_point: Position2D = $FirePoint

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_down"):
		position.y += speed * delta
	if Input.is_action_pressed("ui_up"):
		position.y -= speed * delta
	if Input.is_action_just_pressed("action_fire"):
		fire_bullet()

func fire_bullet() -> void:
	var bullet := Bullet.instance()
	var main = get_tree().current_scene
	main.add_child(bullet)
	bullet.global_position = fire_point.global_position


func _on_Ship_area_entered(area):
	area.queue_free()
	queue_free()
	
func _exit_tree() -> void:
	explode()
	
	
func explode() -> void:
	var explosion = ExplosionEffect.instance()
	var main := get_tree().current_scene
	main.call_deferred("add_child", explosion)
	explosion.global_position = global_position
