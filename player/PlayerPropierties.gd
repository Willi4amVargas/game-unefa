extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -400.0
var bullet_path=preload("res://player/bullet.tscn")

	
func _physics_process(delta: float) -> void:
	var directionx := Input.get_axis("ui_left", "ui_right")
	var directiony := Input.get_axis("ui_up", "ui_down")
	if directiony:
		velocity.y = directiony * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)
	
	if directionx:
		velocity.x = directionx * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("ui_accept"):
		fire()
	
func fire():
	var bullet= bullet_path.instantiate()
	bullet.dir= rotation
	bullet.pos= $"..".global_position
	print(global_position)
	#bullet.rota=global_position
	get_parent().add_child(bullet)
