extends Node2D

onready var jogador = $Marley
onready var boss = $Boss
onready var restart = get_node("/root/Restart")


func _ready():
	boss.iniciar_perseguicao()
	restart.hide()

func _physics_process(delta : float) -> void :
	boss.perseguir(jogador)
	
	if !jogador.visible:
		restart.show()
		restart.next_scene_path = "res://Arquivos/Eras/Pre-hisrtorico/Fases/Fase 2/Level 2.tscn"
		boss.hide()
		get_tree().change_scene_to(restart)

