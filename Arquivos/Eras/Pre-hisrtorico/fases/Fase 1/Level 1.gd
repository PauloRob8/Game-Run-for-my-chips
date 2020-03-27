extends Node2D

onready var jogador = $Marley
onready var boss = $Boss
onready var texto = $Painel/Label
onready var painel = $Painel
onready var portal = $Portal


func _ready():
	boss.iniciar_perseguicao()
	texto.text = (str(jogador.vidas, " X"))
	portal.set_collision_mask_bit(0,false)
	print(portal.collision_mask)
	

func _physics_process(delta : float) -> void :
	var velocidade = jogador.movimento
	var posicao = jogador.position
	texto.text = (str(jogador.vidas, " X"))
	boss.perseguir(jogador)
	ativarPortal()
	
	if jogador.visible:
		painel.move_and_slide(velocidade)
	else:
		boss.hide()
		get_tree().change_scene("res://Arquivos/UI/RestartMenu/Restart.tscn")
		
func ativarPortal():
	if jogador.velocidade_geral.x >= 950:
		portal.set_collision_mask_bit(0,true)
