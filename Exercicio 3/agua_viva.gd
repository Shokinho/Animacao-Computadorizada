extends Node3D


#Variável que referencia o nó AnimationPlayer.
@onready var animacao: AnimationPlayer = $AnimationPlayer

#Inicia a animação da água-viva no momento em que a mesma é adicionada à cena.
func _ready() -> void:
	animacao.play("Take 001")
