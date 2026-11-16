extends Node3D


#Variáveis globais utilizadas ao longo do código.
@onready var arvore_de_animacoes: AnimationTree = $AnimationTree
@onready var maquina_de_estados = arvore_de_animacoes["parameters/playback"]

#Inicializa a reprodução das animações da máquina de estados a partir da animação de Pose.
func _ready() -> void:
	maquina_de_estados.start("Pose")

#Para cada tecla lida, é reproduzida uma animação específica, sendo possível a reprodução de 3 animações:
#Continência, Descanso e Passo de gato. Quando ocorrer a troca entre as animações, será gerada uma interpolação
#com duração de 1 segundo entre a animação atual e a animação nova. Caso a tecla ESC seja lida, o programa será
#encerrado.
func _input(event):
	if event.is_action_pressed("F1"):
		maquina_de_estados.travel("Continencia")
	if event.is_action_pressed("F2"):
		maquina_de_estados.travel("Descanso")
	if event.is_action_pressed("F3"):
		maquina_de_estados.travel("Passo_de_gato")
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
