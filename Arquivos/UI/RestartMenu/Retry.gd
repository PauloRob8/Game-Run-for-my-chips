extends Button



func _on_Retry_button_up() -> void:
	get_tree().paused = false
	get_tree().change_scene("res://Arquivos/Eras/Pre-hisrtorico/fases/Fase 1/Level 1.tscn")
