extends Node2D

var p1_score = 0
var p2_score = 0
var ai_feels_like_it: bool = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://MainMenu.tscn")
	if not Settings.mp: 
		ai(delta)

				
func ai(delta):
	var rng = randi_range(0,Settings.difficulty)
	if rng == 0:
		ai_feels_like_it = true
	else:
		ai_feels_like_it = false
	if $Ball.direction.x < 0:
		$Player2Paddle.stopMovingUp()
		$Player2Paddle.stopMovingDown()
	else:
		if ($Ball.position.y < $Player2Paddle.position.y) && ai_feels_like_it:
			$Player2Paddle.startMovingUp()
		if ($Ball.position.y > $Player2Paddle.position.y) && ai_feels_like_it:
			$Player2Paddle.startMovingDown()


		
		


func _on_enemy_goal_body_entered(body):
	if body.is_in_group("Ball"):
		p2_score += 1
		$Player2Score.text = str("",p2_score)
		body.spawnBall()
		$GoalSound.play()


func _on_player_goal_body_entered(body):
	if body.is_in_group("Ball"):
		p1_score += 1
		$Player1Score.text = str("",p1_score)
		body.spawnBall()
		$GoalSound.play()
