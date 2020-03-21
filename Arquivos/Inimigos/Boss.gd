extends KinematicBody2D


export var speed:= Vector2(100.0,1000.0)
var velocity = Vector2.ZERO
const 	FLOOR_NORMAL = Vector2.UP

func _ready() -> void:
	set_physics_process(true)
	velocity.x = speed.x

func _physics_process(delta : float) -> void :
	velocity.y = move_and_slide(velocity,FLOOR_NORMAL).y
