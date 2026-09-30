extends Node3D


#Variáveis globais utilizadas ao longo do código.
@onready var animacao: AnimationPlayer = $"Água-viva/AnimationPlayer"
@onready var controle = 1
@onready var tween = get_tree().create_tween()
@onready var corpo_da_agua_viva: MeshInstance3D = $"Água-viva/group/Cylinder_002"
@onready var tentaculos_da_agua_viva: MeshInstance3D = $"Água-viva/group/BezierCurve_002"
@onready var forma: HSlider = $Interface/VBoxContainer/HBoxContainer/HSlider
@onready var forma2: HSlider = $Interface/VBoxContainer/HBoxContainer2/HSlider
@onready var forma3: HSlider = $Interface/VBoxContainer/HBoxContainer3/HSlider

#Verifica se a animação da água-viva está sendo reproduzida e só permite a reprodução da nova animação depois que
#a animação inicial é reproduzida.
func _process(delta: float) -> void:
	if not animacao.is_playing():
		controle = 0


#Quando a tecla Enter é pressionada, um novo objeto Tween é criado, os valores dos alvos são lidos e a animação
#contendo a interpolarização entre os valores atuais dos alvos e os valores fornecidos dos alvos é reproduzida.
#É importante dizer que, como o modelo da água-viva é divido em partes, é necessário processar os valores do alvo
#da blend shape de cada uma das partes em paralelo para que a animação de cada uma das partes seja reproduzida ao
#mesmo tempo que a outra. Além disso, as animações dos alvos são reproduzidas em paralelo para que os valores de
#cada um dos alvos sejam interpolados. Quando a tecla ESC é pressionada, o programa é encerrado.
func _input(event):
	if event.is_action_pressed("ui_text_submit") and controle == 0:
		tween = get_tree().create_tween()
		tween.tween_property(corpo_da_agua_viva, "blend_shapes/blendShape1.Corpo", forma.value, 1.0)
		tween.set_parallel()
		tween.tween_property(tentaculos_da_agua_viva, "blend_shapes/blendShape1.Corpo", forma.value, 1.0)
		tween.tween_property(corpo_da_agua_viva, "blend_shapes/blendShape1.TentaculosDobrados", forma2.value, 1.0)
		tween.tween_property(tentaculos_da_agua_viva, "blend_shapes/blendShape1.TentaculosDobrados", forma2.value, 1.0)
		tween.tween_property(corpo_da_agua_viva, "blend_shapes/blendShape1.TentaculosEmEspiral", forma3.value, 1.0)
		tween.tween_property(tentaculos_da_agua_viva, "blend_shapes/blendShape1.TentaculosEmEspiral", forma3.value, 1.0)
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
