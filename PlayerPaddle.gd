extends CharacterBody2D

@onready var initial_x = position.x
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	position.x = initial_x
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.y = 0
	if Input.is_action_pressed("down"):
		velocity.y = 500
	
	if Input.is_action_pressed("up"):
		velocity.y = -500
		
	move_and_slide()
	
