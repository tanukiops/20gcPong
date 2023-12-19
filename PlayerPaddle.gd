extends CharacterBody2D

@onready var initial_x = position.x

func _process(delta):
	position.x = initial_x
	

func _physics_process(delta):
	velocity.y = 0
	if Input.is_action_pressed("down"):
		velocity.y = Settings.paddleSpeed
	
	if Input.is_action_pressed("up"):
		velocity.y = Settings.paddleSpeed * -1
		
	move_and_slide()
	
