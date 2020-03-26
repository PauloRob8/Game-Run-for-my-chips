extends KinematicBody2D


export var speed:= Vector2(200.0,1000.0)
var velocity = Vector2.ZERO
const 	FLOOR_NORMAL = Vector2.UP

onready var player = get_node("/root/Level 1-1/TileMap/Marley")

func _ready() -> void:
	set_physics_process(true)
	velocity.x = speed.x


func _physics_process(delta):
	var dir = (player.global_position - global_position).normalized()
	move_and_collide(dir * speed * delta)
