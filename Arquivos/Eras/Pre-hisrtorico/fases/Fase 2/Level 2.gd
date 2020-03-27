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
		boss.hide()
		get_tree().change_scene("res://Arquivos/UI/RestartMenu/Restart.tscn")

