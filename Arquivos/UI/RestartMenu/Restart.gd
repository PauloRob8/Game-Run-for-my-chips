extends Control

export(String, FILE) var next_scene_path = ""

func _on_Button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
