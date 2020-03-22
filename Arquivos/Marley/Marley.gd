extends KinematicBody2D

var velocidade_geral = Vector2(500,900)
export var vetor = Vector2.ZERO
export var gravidade_geral = 4500
var permite_duplo = true


func _on_Area2D_body_entered(body: Node) -> void:
	vetor.x = 0
	
func _physics_process(delta : float) -> void :
	var direcao = calcular_direcao()
	vetor = calcular_movimento(vetor, direcao ,velocidade_geral)
	vetor = move_and_slide(vetor, Vector2.UP)

func calcular_direcao() -> Vector2:
	
	var direcao := Vector2((Input.get_action_strength("mover_direita")
	-Input.get_action_strength("mover_esquerda")), -1.0 
	if Input.get_action_strength("mover_cima") and is_on_floor() else 1.0)
	return direcao
	
func calcular_movimento(
		linear : Vector2,
		direcao : Vector2,
		velocidade : Vector2) -> Vector2:

	
	if is_on_floor():
		permite_duplo = true
	
	if direcao.x == -1:
		if linear.x > 0:
			linear.x = 0
	if direcao.x == 1:
		if linear.x < 0:
			linear.x = 0
	
	var nova_velocidade := linear
	nova_velocidade.x += velocidade.x * direcao.x  / 100
	nova_velocidade.y += gravidade_geral * get_physics_process_delta_time()
	
	if direcao.y == -1:
		nova_velocidade.y = velocidade.y * direcao.y
	
	if Input.get_action_strength("mover_baixo"):
		nova_velocidade.y = velocidade.y * 2
	
	if Input.is_action_just_pressed("mover_cima") and is_on_floor() == false and permite_duplo == true:
		nova_velocidade.y = velocidade.y * -1
		permite_duplo = false
	
	return nova_velocidade;


func _on_Objeto1_area_entered(area):
	vetor.x = 0

