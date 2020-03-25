extends KinematicBody2D

export var speed:= Vector2(500.0,0)
export var gravidade: = 3000.0
var velocity = Vector2.ZERO
const 	FLOOR_NORMAL = Vector2.UP

func _ready() -> void:
	set_physics_process(false)
	velocity.x = -speed.x
	$"Chrome dinosaur".flip_h = !$"Chrome dinosaur".flip_h

func _physics_process(delta : float) -> void :
	if is_on_wall():
		velocity.x *= -1.0
		$"Chrome dinosaur".flip_h = !$"Chrome dinosaur".flip_h
	if is_on_floor():
		velocity.y = 0
	else:
		velocity.y = gravidade
	move_and_slide(velocity,FLOOR_NORMAL)
	



