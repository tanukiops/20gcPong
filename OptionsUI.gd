extends Control

func _ready():
	$CenterContainer/VBoxContainer2/SettingsContainer/Difficulty.select(Settings.getDifficulty())
	$CenterContainer/VBoxContainer2/SettingsContainer/PaddleSpeedSlider.value = Settings.paddleSpeed
	$CenterContainer/VBoxContainer2/SettingsContainer/BallSpeedSlider.value = Settings.ballSpeed		


func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://MainMenu.tscn")


func _on_back_pressed():
	get_tree().change_scene_to_file("res://MainMenu.tscn")



func _on_save_pressed():
	Settings.setDifficulty($CenterContainer/VBoxContainer2/SettingsContainer/Difficulty.selected)
	Settings.paddleSpeed = $CenterContainer/VBoxContainer2/SettingsContainer/PaddleSpeedSlider.value
	Settings.ballSpeed = $CenterContainer/VBoxContainer2/SettingsContainer/BallSpeedSlider.value
	get_tree().change_scene_to_file("res://MainMenu.tscn")


func _on_save_focus_entered():
	$HoverSound.play() 


func _on_back_focus_entered():
	$HoverSound.play() 
