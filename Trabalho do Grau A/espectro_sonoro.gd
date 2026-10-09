extends Node3D


#Variáveis globais utilizadas ao longo do código.
@onready var musica: AudioStreamPlayer = $Musica
@onready var espectro_sonoro: AudioEffectSpectrumAnalyzerInstance
@onready var corpo_da_agua_viva: Node3D = $"ÁguaViva/group/Cylinder"
@onready var tentaculos_da_agua_viva: Node3D = $"ÁguaViva/group/BezierCurve"
@onready var amplitude = 0.0

#Armazena a instância do efeito de áudio relacionado ao barramento e ao efeito de áudio informados, 
#respectivamente. Neste caso, o barramento informado é o Master e o efeito de áudio informado é o
#SpectrumAnalyzer. O SpectrumAnalyzer será usado para ler o espectro sonoro da música selecionada.
func _ready() -> void:
	espectro_sonoro = AudioServer.get_bus_effect_instance(0, 0)


#Armazena a magnitude máxima, ou seja, a amplitude máxima encontrada entre as frequências de 20 a 20000 Hertz e
#modifica os pesos dos alvos de acordo com os valores das amplitudes lidas. Este processo é executado a cada
#quadro da renderização.
func _process(delta: float) -> void:
	amplitude = espectro_sonoro.get_magnitude_for_frequency_range(20, 20000).length()
	corpo_da_agua_viva.set_blend_shape_value(0, amplitude)
	tentaculos_da_agua_viva.set_blend_shape_value(0, amplitude)
	corpo_da_agua_viva.set_blend_shape_value(1, amplitude)
	tentaculos_da_agua_viva.set_blend_shape_value(1, amplitude)


#Quando a tecla ESC é pressionada, o programa é encerrado.
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
