extends Control

onready var scene_tree = get_tree()
onready var pauseUi: ColorRect = get_node("ColorRect")

var paused = false setget set_paused

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		self.paused = !paused
		scene_tree.set_input_as_handled()

func set_paused(value: bool ) -> void:
	paused = value
	scene_tree.paused = value
	pauseUi.visible = value


