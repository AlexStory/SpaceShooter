extends Area2D

signal enemy_killed

export(float) var speed := 20 
export(int) var armor := 3

const ExplosionEffect = preload("res://Effects/ExplosionEffect.tscn")


func _ready() -> void:
	var main = get_tree().current_scene
	if main is GameWorld:
		var _success = connect("enemy_killed", main, "_on_enemy_killed")


func _process(delta) -> void:
	position.x -= speed * delta


func _on_Enemy_body_entered(body: Bullet) -> void:
	armor -= 1
	body.hit_object()
	body.queue_free()
	if armor <= 0:
		emit_signal("enemy_killed")
		queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	
func _exit_tree() -> void:
	explode()
	
	
func explode() -> void:
	var explosion = ExplosionEffect.instance()
	var main := get_tree().current_scene
	main.call_deferred("add_child", explosion)
	explosion.global_position = global_position
