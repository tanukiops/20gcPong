extends Node
var mp: bool = false
var ballSpeed: float = 500.0
var paddleSpeed: float = 700.0
var difficulty = 0
func setBallSpeed(ballSpeed: float):
	self.ballSpeed = ballSpeed
func setPaddleSpeed(paddleSpeed: float):
	self.paddleSpeed = paddleSpeed
func setMultiplayer(mp: bool):
	self.mp = mp
func setDifficulty(difficulty):
	if difficulty == 0:
		self.difficulty = 50
	elif difficulty == 1:
		self.difficulty = 20
	elif difficulty == 2:
		self.difficulty = 10
	elif difficulty == 3:
		self.difficulty = 0
func getDifficulty():
	if self.difficulty == 50:
		return 0
	elif self.difficulty == 20:
		return 1
	elif self.difficulty == 10:
		return 2
	elif self.difficulty == 0:
		return 3
