extends Node3D

#Variáveis globais utilizadas ao longo do código.
@onready var sistema_de_particulas: GPUParticles3D = $Sistema_de_particulas
@onready var sistema_de_particulas2: GPUParticles3D = $Sistema_de_particulas2
@onready var sistema_de_particulas3: GPUParticles3D = $Sistema_de_particulas3
@onready var sistema_de_particulas4: GPUParticles3D = $Sistema_de_particulas4
@onready var sistema_de_particulas5: GPUParticles3D = $Sistema_de_particulas5
@onready var emissor: Label = $Interface/VBoxContainer/Tipo_de_emissor
@onready var cor: Label = $Interface/VBoxContainer/Cor_da_particula
@onready var transparencia: Label = $Interface/VBoxContainer/Transparencia_da_particula
@onready var velocidade: Label = $Interface/VBoxContainer/Velocidade_da_particula
@onready var direcao: Label = $Interface/VBoxContainer/Direcao_da_particula
@onready var forma: Label = $Interface/VBoxContainer/Forma_da_particula
@onready var tamanho: Label = $Interface/VBoxContainer/Tamanho_da_particula
@onready var tempo_de_vida: Label = $Interface/VBoxContainer/Tempo_de_vida_da_particula
@onready var morte: Label = $Interface/VBoxContainer/Morte

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Configuração do primeiro sistema de partículas e de suas respectivas informações, os quais são exibidos
	#primeiro na tela.
	sistema_de_particulas.emitting = true
	emissor.text = "Tipo de emissor: Ponto"
	cor.text = "Cor: #bc00c7"
	transparencia.text = "Transparência: 1.0"
	velocidade.text = "Velocidade: 1.0"
	direcao.text = "Direção: 0.0, -1.0, 0.0 (Varia entre 0.0, -1.0, 0.0, 0.2, -1.0, 0.2, -0.2, -1.0, -0.2, 0.2, -1.0, 0.2 e 0.0, -1.0, 0.0 ao longo do tempo)"
	forma.text = "Forma: QuadMesh (Billboard)"
	tamanho.text = "Tamanho: 0.1"
	tempo_de_vida.text = "Tempo de vida: 3 segundos"
	morte.text = "Morte: Tempo de vida"


func _input(event):
	#Lê as entradas do teclado e, para cada tipo de tecla lida, mostra o seu respectivo sistema de partículas na
	#tela, além de suas respectivas informações. Antes do sistema de partículas e de suas respectivas
	#informações serem renderizadas na tela, as emissões de todos os sistemas de partículas são desativadas.
	if event.is_action_pressed("F1"):
		sistema_de_particulas.emitting = false
		sistema_de_particulas2.emitting = false
		sistema_de_particulas3.emitting = false
		sistema_de_particulas4.emitting = false
		sistema_de_particulas5.emitting = false
		sistema_de_particulas.emitting = true
		emissor.text = "Tipo de emissor: Ponto"
		cor.text = "Cor: #bc00c7"
		transparencia.text = "Transparência: 1.0"
		velocidade.text = "Velocidade: 1.0"
		direcao.text = "Direção: 0.0, -1.0, 0.0 (Varia entre 0.0, -1.0, 0.0, 0.2, -1.0, 0.2, -0.2, -1.0, -0.2, 0.2, -1.0, 0.2 e 0.0, -1.0, 0.0 ao lonfo do tempo)"
		forma.text = "Forma: QuadMesh (Billboard)"
		tamanho.text = "Tamanho: 0.1"
		tempo_de_vida.text = "Tempo de vida: 3 segundos"
		morte.text = "Morte: Tempo de vida"
	if event.is_action_pressed("F2"):
		sistema_de_particulas.emitting = false
		sistema_de_particulas2.emitting = false
		sistema_de_particulas3.emitting = false
		sistema_de_particulas4.emitting = false
		sistema_de_particulas5.emitting = false
		sistema_de_particulas2.emitting = true
		emissor.text = "Tipo de emissor: Esfera"
		cor.text = "Cor: #ffffff"
		transparencia.text = "Transparência: 1.0"
		velocidade.text = "Velocidade: Não definido"
		direcao.text = "Direção: Não definido"
		forma.text = "Forma: QuadMesh (Billboard)"
		tamanho.text = "Tamanho: 0.1 (Varia entre 0.1 e 0.3 ao longo do tempo)"
		tempo_de_vida.text = "Tempo de vida: 3 segundos"
		morte.text = "Morte: Tempo de vida"
	if event.is_action_pressed("F3"):
		sistema_de_particulas.emitting = false
		sistema_de_particulas2.emitting = false
		sistema_de_particulas3.emitting = false
		sistema_de_particulas4.emitting = false
		sistema_de_particulas5.emitting = false
		sistema_de_particulas3.emitting = true
		emissor.text = "Tipo de emissor: Caixa (y = 0)"
		cor.text = "Cor: #ffffff (Varia entre #ffffff, #ff6630 e #f31d00 ao longo do tempo)"
		transparencia.text = "Transparência: 1.0"
		velocidade.text = "Velocidade: 3.0"
		direcao.text = "Direção: 0.0, -1.0, 0.0"
		forma.text = "Forma: QuadMesh (Billboard)"
		tamanho.text = "Tamanho: 1.0"
		tempo_de_vida.text = "Tempo de vida: 3 segundos"
		morte.text = "Morte: Tempo de vida"
	if event.is_action_pressed("F4"):
		sistema_de_particulas.emitting = false
		sistema_de_particulas2.emitting = false
		sistema_de_particulas3.emitting = false
		sistema_de_particulas4.emitting = false
		sistema_de_particulas5.emitting = false
		sistema_de_particulas4.emitting = true
		emissor.text = "Tipo de emissor: Esfera"
		cor.text = "Cor: #93006b"
		transparencia.text = "Transparência: 1.0"
		velocidade.text = "Velocidade: 1.0 (Turbulência)"
		direcao.text = "Direção: 1.0, 0.0, 0.0 (Turbulência)"
		forma.text = "Forma: Esfera"
		tamanho.text = "Tamanho: 0.1"
		tempo_de_vida.text = "Tempo de vida: 3 segundos"
		morte.text = "Morte: Tempo de vida"
	if event.is_action_pressed("F5"):
		sistema_de_particulas.emitting = false
		sistema_de_particulas2.emitting = false
		sistema_de_particulas3.emitting = false
		sistema_de_particulas4.emitting = false
		sistema_de_particulas5.emitting = false
		sistema_de_particulas5.emitting = true
		emissor.text = "Tipo de emissor: Ponto"
		cor.text = "Cor: #d8d0ffc8"
		transparencia.text = "Transparência: 0.784 (Varia entre 0.784 e 0.0 ao longo do tempo)"
		velocidade.text = "Velocidade: 1.0"
		direcao.text = "Direção: 0.0, 1.0, 0.0"
		forma.text = "Forma: Esfera"
		tamanho.text = "Tamanho: 0.1"
		tempo_de_vida.text = "Tempo de vida: 3 segundos"
		morte.text = "Morte: Transparência"
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
