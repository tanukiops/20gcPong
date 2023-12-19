extends CharacterBody2D


var direction = Vector2(1,1)

@onready var screenwidth = get_viewport().get_visible_rect().size.x
@onready var screenheight = get_viewport().get_visible_rect().size.y

func _ready():
	spawnBall()
	
func spawnBall():
	#Put ball in middle of screen
	position.x = screenwidth/2
	position.y = screenheight/2
	
	var x = randi_range(0, 1)
	var y = randi_range(0, 1)
	if x == 0: x = -1
	if y == 0: y = -1
	direction.x = x
	direction.y = y
	velocity = Settings.ballSpeed * direction
	
func _physics_process(delta):
	
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	if collision:
		$BleepSound.play()
		var reflect = collision.get_remainder().bounce(collision.get_normal())
		velocity = velocity.bounce(collision.get_normal())
		direction = reflect.normalized() 
		move_and_collide(reflect * delta)



