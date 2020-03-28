extends KinematicBody2D

export var speed := Vector2(350.0,350.0)
onready var boss = $"."
onready var timer = $Timer

func _ready():
	boss.hide()

func perseguir(player : KinematicBody2D):
	var velocidade = Vector2.ZERO
	if boss.visible:
		if boss.position.y+5 > player.position.y and boss.position.y-5 < player.position.y:
			velocidade.y = 0
		elif boss.position.y > player.position.y :
			velocidade.y = speed.y * -1
		elif boss.position.y < player.position.y  :
			velocidade.y = speed.y
		
		if boss.position.x+5 > player.position.x and boss.position.x-5 < player.position.x:
			velocidade.x = 0
		elif boss.position.x > player.position.x :
			velocidade.x = speed.x * -1
		elif boss.position.x < player.position.x  :
			velocidade.x = speed.x

		move_and_slide(velocidade)
	
func iniciar_perseguicao(): 
	timer.start()

func _on_Timer_timeout():
	boss.show()

func _on_BossArea_area_entered(area):
	boss.hide()
