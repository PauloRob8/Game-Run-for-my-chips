extends Area2D



onready var playerRaio: AnimationPlayer = get_node("AnimationPlayer")

func _ready() -> void:
	pass # Replace with function body.


func _on_Raio_body_entered(body: Node) -> void:
	playerRaio.play("fade")
