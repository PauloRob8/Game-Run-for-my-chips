extends Area2D


onready var portalPlayer: AnimationPlayer = $AnimationPlayer

export var next_scene: PackedScene


func _get_configuration_warning() -> String:
	return "Proxima cena não pode ser vazia" if not next_scene else ""
	
func _on_Portal_body_entered(body: Node) -> void:
	teleport()
	
func teleport() -> void:
	portalPlayer.play("fade_in")
	yield(portalPlayer,"animation_finished")
	get_tree().change_scene_to(next_scene)



