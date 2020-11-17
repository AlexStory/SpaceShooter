extends Area2D

export(int) var speed := 100

func _process(delta: float):
	if Input.is_action_pressed("ui_down"):
		position.y += speed * delta
	
	if Input.is_action_pressed("ui_up"):
		position.y -= speed * delta
