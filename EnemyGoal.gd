extends Area2D

@onready var score_text : Label = get_node("../Player2Score")
var score = 0

func _on_body_entered(body):
	if body.is_in_group("Ball"):
		score += 1
		score_text.text = str("",score)
		body.spawnBall()
		
