extends Node2D

func _physics_process(delta : float) -> void :
	var background = $"Cenario-Fundo"
	var jogador = $TileMap/Marley
	var velocidade_jogador = jogador.vetor
	var velocidade = Vector2.ZERO
	
	var posicao = jogador.position
	velocidade.x = velocidade_jogador.x
	#if velocidade_jogador.x > 0:
	#	if velocidade_jogador.x-4 > 0:
	#		velocidade.x = velocidade_jogador.x-4

	#elif velocidade_jogador.x < 0:
	#	if velocidade_jogador.x+4 < 0:
	#		velocidade.x = velocidade_jogador.x+4
	
	
	
	background.move_and_slide(velocidade)

