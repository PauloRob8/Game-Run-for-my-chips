extends StaticBody2D

onready var playerRaio: AnimationPlayer = get_node("AnimationPlayer")

func _on_Area2D_area_entered(area):
	playerRaio.play("fade")
