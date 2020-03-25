extends Node2D

onready var background = $"Cenario-Fundo"
onready var jogador = $Marley
onready var boss = $Boss
onready var texto = $Painel/Label
onready var painel = $Painel


func _ready():
	boss.iniciar_perseguicao()
	texto.text = (str(jogador.vidas, " X"))
	

func _physics_process(delta : float) -> void :
	var velocidade = jogador.movimento
	var posicao = jogador.position
	texto.text = (str(jogador.vidas, " X"))
	boss.perseguir(jogador)
	print(jogador.vidas)
	print(jogador.teste1.wait_time)
	
	if jogador.visible:
		background.move_and_slide(velocidade)
		painel.move_and_slide(velocidade)
	else:
		var a = get_node("/root/Restart")
		a.next_scene_path = "res://Arquivos/Eras/Pre-hisrtorico/Fases/Fase 1/Level 1.tscn"
		boss.hide()
		get_tree().change_scene_to(a)
		#print(a)
