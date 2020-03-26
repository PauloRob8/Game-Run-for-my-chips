extends KinematicBody2D

export var speed:= Vector2(300.0,0)
var velocity = Vector2.ZERO
const 	FLOOR_NORMAL = Vector2.UP

func _ready() -> void:
	set_physics_process(false)
	velocity.x = -speed.x
	velocity.y = speed.y

func _physics_process(delta : float) -> void :
	if is_on_wall():
		velocity.x *= -1.0
		$"Chrome dinosaur".flip_h = !$"Chrome dinosaur".flip_h
	move_and_slide(velocity)



