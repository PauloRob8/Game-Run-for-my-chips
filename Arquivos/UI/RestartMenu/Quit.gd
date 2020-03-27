extends Button

export(String, FILE) var next_scene_path = ""

func _on_Quit_button_up() -> void:
	get_tree().paused = false
	get_tree().change_scene(next_scene_path)
