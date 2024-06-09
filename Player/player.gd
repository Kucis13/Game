extends CharacterBody2D

@export var speed = 100
@export var maxSpeed = 150


func _physics_process(delta):
	var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity += direction * speed * delta
	
	var direction_down = Input.is_action_pressed("ui_down")
	var direction_up = Input.is_action_pressed("ui_up")
	var direction_left = Input.is_action_pressed("ui_left")
	var direction_right = Input.is_action_pressed("ui_right")

	if direction_up:
		position.y -= speed * delta
	if direction_down:
		position.y += speed * delta
	if direction_left:
		position.x -= speed * delta
	if direction_right:
		position.x += speed * delta
		
	if direction.x == 0:
		velocity.x = 0
	if direction.y == 0:
		velocity.y = 0
	
	if velocity == Vector2.ZERO:
		$AnimationTree.set("parameters/Idle/blend_position",Vector2(0,1))
	else:
		$AnimationTree.set("parameters/Idle/blend_position",direction)
		move_and_slide()
