extends Node2D

onready var background = $"Cenario-Fundo"
onready var jogador = $Marley
onready var boss = $Boss
onready var texto = $Painel/Label
onready var painel = $Painel
onready var portal = $Portal
onready var restart = get_node("/root/Restart")

func _ready():
	boss.iniciar_perseguicao()
	texto.text = (str(jogador.vidas, " X"))
	restart.hide()
	portal.set_collision_mask_bit(0,false)
	print(portal.collision_mask)
	

func _physics_process(delta : float) -> void :
	var velocidade = jogador.movimento
	var posicao = jogador.position
	texto.text = (str(jogador.vidas, " X"))
	boss.perseguir(jogador)
	ativarPortal()
	
	if jogador.visible:
		background.move_and_slide(velocidade)
		painel.move_and_slide(velocidade)
	else:
		restart.show()
		restart.next_scene_path = "res://Arquivos/Eras/Pre-hisrtorico/Fases/Fase 1/Level 1.tscn"
		boss.hide()
		get_tree().change_scene_to(restart)
		
func ativarPortal():
	if jogador.velocidade_geral.x >= 950:
		portal.set_collision_mask_bit(0,true)
