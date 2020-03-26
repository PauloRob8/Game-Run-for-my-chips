extends Area2D

export var next_scene: PackedScene


func _on_Chip_body_entered(body: Node) -> void:
	get_tree().change_scene_to(next_scene)
