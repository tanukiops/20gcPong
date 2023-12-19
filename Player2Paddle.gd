extends CharacterBody2D

var movingUp: bool = false
var movingDown: bool = false
@onready var initial_x = position.x
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	position.x = initial_x
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.y = 0
	if Input.is_action_pressed("p2_down") && Settings.mp:
		velocity.y = Settings.paddleSpeed
	
	if Input.is_action_pressed("p2_up") && Settings.mp:
		velocity.y = Settings.paddleSpeed * -1
	
	if not Settings.mp:
		if movingUp && not movingDown:
			velocity.y = Settings.paddleSpeed * -1
		elif movingDown && not movingUp:
			velocity.y = Settings.paddleSpeed
	move_and_slide()
	
func startMovingUp():
	movingUp = true
	movingDown = false
func startMovingDown():
	movingDown = true
	movingUp = false

func stopMovingUp():
	movingUp = false
func stopMovingDown():
	movingDown = false
