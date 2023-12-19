extends CharacterBody2D


const SPEED = 500.0
var direction = Vector2(1,1)
var random = RandomNumberGenerator.new()

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	spawnBall()
	
func spawnBall():
	position.x = 0
	position.y = 0
	
	random.randomize()
	var x = random.randi_range(-1, 1)
	var y = random.randi_range(-1, 1)
	if x == 0:
		x = -1
	if y == 0:
		y = -1
	direction.x = x
	direction.y = y
	velocity = SPEED * direction
	
func _physics_process(delta):
	
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	if collision:
		var reflect = collision.get_remainder().bounce(collision.get_normal())
		velocity = velocity.bounce(collision.get_normal())
		move_and_collide(reflect)



