extends Node3D

#Variáveis globais utilizadas ao longo do código
@onready var distancia = Vector3()
@onready var ponto_intermediario = preload("res://Ponto_intermediario.tscn").instantiate()
@onready var pontos_de_controle = get_tree().get_nodes_in_group("pontos_de_controle")
@onready var pontos_intermediarios = []
@onready var curva = 0
@onready var matriz_geometrica = []
@onready var matriz_de_base= []
@onready var matriz_dos_parametros = []
@onready var resultado = []
@onready var borboleta: Node3D = $Borboleta
@onready var ponto = Vector3()
@onready var animacao = 1
@onready var indice_da_curva = 0
@onready var numero = 0
@onready var mensagem: Label = $Interface/Texto2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Itera sobre o array que contém todos os pontos de controle presentes no ambiente e, para cada um dos pontos
	#de controle presente no array, com exceção do último, calcula a distância entre o ponto de controle
	#referido e o subsequente ponto de controle presente no array. Em seguida, gera 10 pontos intermediários
	#entre o conjunto de pontos de controle referido, atribuindo a posição de cada um dos pontos intermediários
	#o resultado da seguinte expressão: posição do primeiro ponto de controle do conjunto + t * distância. O
	#vetor subtraído do resultado da expressão somente ajusta a altura do ponto intermediário para que o mesmo
	#fique rente ao chão. Além disso, o ponto intermediário é previamente instanciado, adicionado ao ambiente,
	#após ter a sua posição calculada, e adicionado a lista de pontos intermediários.
	for ponto_de_controle in range(pontos_de_controle.size()-1):
		distancia = pontos_de_controle[ponto_de_controle+1].position - pontos_de_controle[ponto_de_controle].position
		for numero in range(1, 11):
			ponto_intermediario.position = (pontos_de_controle[ponto_de_controle].position + 0.1 * numero * distancia) - Vector3(0, 0.05, 0)
			add_child(ponto_intermediario)
			pontos_intermediarios.append(ponto_intermediario)
			ponto_intermediario = preload("res://Ponto_intermediario.tscn").instantiate()
	#Configuração prévia das variáveis utilizadas na animação da borboleta para o seu correto funcionamento.
	borboleta.position = pontos_de_controle[0].position
	borboleta.look_at(pontos_intermediarios[0].position, Vector3.UP)
	ponto = pontos_intermediarios[0].position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#A animação da borboleta percorrendo os pontos intermediários só ocorre uma vez a cada aperto de tecla,
	#enquanto a variável animacao for diferente de 0. A cada iteração no laço, a posição da borboleta é
	#incrementada com o resultado da seguinte expressão: distância normalizada entre a borboleta e o ponto 
	#intermediário referido * velocidade da borboleta * delta. Cada vez que a posição da borboleta for igual a
	#posição do ponto intermediário que ela está indo em direção ou quando o passo da borboleta ultrapassar o
	#ponto intermediário que ela está indo em direção, o ponto intermediário que a mesma está usando como
	#referência para percorrer a curva será atualizado para o próximo ponto intermediário presente no array e a
	#borboleta passará a apontar para o novo ponto intermediário de referência. Quando a posição da borboleta
	#for igual a posição do último ponto intermediário presente no array ou quando o passo dela ultrapassar o 
	#último ponto intermediário presente no array, quando o mesmo for o ponto intermediário de referência, a
	#variável animacao será definida para 0, fazendo com que o laço da animação pare de ser executado, e a
	#posição da borboleta será atualizada para a posição do último ponto intermediário, caso a segunda condição
	#seja verdadeira.
	if animacao == 1:
		if borboleta.position == pontos_intermediarios[indice_da_curva].position or 1 * delta > (ponto - borboleta.position).length():
			ponto = pontos_intermediarios[indice_da_curva+1].position
			borboleta.look_at(ponto, Vector3.UP)
			indice_da_curva += 1
		borboleta.position += (ponto - borboleta.position).normalized() * 1 * delta
		if borboleta.position == pontos_intermediarios[-1].position:
			animacao = 0
		if 1 * delta > (pontos_intermediarios[-1].position - borboleta.position).length():
			borboleta.position = pontos_intermediarios[-1].position
			animacao = 0


func _input(event):
	#Somente se a variável animacao for 0, as teclas F1 e F2 poderão ser lidas. A tecla F1 executará o processo
	#de criação da curva linear e a tecla F2 executará o processo de criação da curva cúbica, neste caso, a
	#curva de Bézier. Antes de cada uma das condições executar o processo de criação de sua respectiva curva, o
	#array contendo os pontos intermediários é percorrido e cada uma das instâncias dos pontos intermediários é
	#excluída. Além disso, o array contendo os pontos intermediários é limpo.
	if animacao == 0:
		if event.is_action_pressed("F1"):
			curva = 0
			for ponto in range(pontos_intermediarios.size()):
				pontos_intermediarios[ponto].queue_free()
			pontos_intermediarios.clear()
			#Este trecho de código é o mesmo que está presente na função _ready(), o qual representa o processo
			#de criação da curva linear.
			for ponto_de_controle in range(pontos_de_controle.size()-1):
				distancia = pontos_de_controle[ponto_de_controle+1].position - pontos_de_controle[ponto_de_controle].position
				for numero in range(1, 11):
					ponto_intermediario.position = (pontos_de_controle[ponto_de_controle].position + 0.1 * numero * distancia) - Vector3(0, 0.05, 0)
					add_child(ponto_intermediario)
					pontos_intermediarios.append(ponto_intermediario)
					ponto_intermediario = preload("res://Ponto_intermediario.tscn").instantiate()
			#Configuração prévia das variáveis utilizadas na animação da borboleta para o seu correto
			#funcionamento.
			animacao = 1
			borboleta.position = pontos_de_controle[0].position
			borboleta.look_at(pontos_intermediarios[0].position, Vector3.UP)
			ponto = pontos_intermediarios[0].position
			indice_da_curva = 0
		if event.is_action_pressed("F2"):
			curva = 1
			for ponto in range(pontos_intermediarios.size()):
				pontos_intermediarios[ponto].queue_free()
			pontos_intermediarios.clear()
			#Antes dos pontos intermediários da curva cúbica serem calculados, é verificado se há pelo menos 4
			#pontos de controle no ambiente. As posições dos pontos intermediários da curva cúbica é dada pela
			#seguinte multiplicação entre matrizes: matriz geométrica * matriz de base * matriz do parâmetro t,
			#onde a matriz geométrica corresponde a matriz [[P1.x, P2.x, P3.x, P4.x], [P1.y, P2.y, P3.y, P4.y],
			#[P1.z, P2.z, P3.z, PP4.z]], a matriz de base corresponde a matriz [[1, -3, 3, -1], [0, 3, -6, 3],
			#[0, 0, 3, -3], [0, 0, 0, 1]] e a matriz dos parâmetros t corresponde a matriz [[1], [t],
			#[t elevado ao quadrado], [t elevado ao cubo]. Após a multiplicação entre as matrizes ser efetuada,
			#o resultado é convertido de um Array para um Vector3. Novamente, o vetor subtraído do resultado da
			#multiplicação somente ajusta a altura do ponto intermediário para que o mesmo fique rente ao chão.
			#Como dito antes, o ponto intermediário é previamente instanciado, adicionado ao ambiente, após ter
			#a sua posição calculada, e adicionado a lista de pontos intermediários.
			if pontos_de_controle.size() >= 4 and (pontos_de_controle.size() - 4) % 3 == 0:
				if pontos_de_controle.size() == 4:
					numero = 1
				else:
					numero = (pontos_de_controle.size() - 4) / 3 + 1
				for ponto_de_controle in range(numero):
					if ponto_de_controle == 1:
						ponto_de_controle += 2
					matriz_geometrica = [[pontos_de_controle[ponto_de_controle].position.x, pontos_de_controle[ponto_de_controle+1].position.x, pontos_de_controle[ponto_de_controle+2].position.x, pontos_de_controle[ponto_de_controle+3].position.x], 
										 [pontos_de_controle[ponto_de_controle].position.y, pontos_de_controle[ponto_de_controle+1].position.y, pontos_de_controle[ponto_de_controle+2].position.y, pontos_de_controle[ponto_de_controle+3].position.y],
										 [pontos_de_controle[ponto_de_controle].position.z, pontos_de_controle[ponto_de_controle+1].position.z, pontos_de_controle[ponto_de_controle+2].position.z, pontos_de_controle[ponto_de_controle+3].position.z]]
					matriz_de_base = [[1, -3, 3, -1], 
									  [0, 3, -6, 3], 
									  [0, 0, 3, -3], 
									  [0, 0, 0, 1]]
					for numero in range(1, 11):
						matriz_dos_parametros = [[1.0],
												 [(0.1 * numero)],
												 [(0.1 * numero) ** 2],
												 [(0.1 * numero) ** 3]]
						resultado = multiplicacao_de_matrizes(multiplicacao_de_matrizes(matriz_geometrica, matriz_de_base), matriz_dos_parametros)
						ponto_intermediario.position = Vector3(resultado[0][0], resultado[1][0], resultado[2][0]) - Vector3(0, 0.05, 0)
						add_child(ponto_intermediario)
						pontos_intermediarios.append(ponto_intermediario)
						ponto_intermediario = preload("res://Ponto_intermediario.tscn").instantiate()
				#Configuração prévia das variáveis utilizadas na animação da borboleta para o seu correto
				#funcionamento.
				animacao = 1
				borboleta.position = pontos_de_controle[0].position
				borboleta.look_at(pontos_intermediarios[0].position, Vector3.UP)
				ponto = pontos_intermediarios[0].position
				indice_da_curva = 0
			else:
				mensagem.text = "A curva cúbica necessita de pelo menos 4 pontos de controles para poder ser calculada. Caso queira-se obter outra curva a patir do último ponto de controle fornecido, é necessário adicionar mais três pontos de controle ao ambiente."
				print("A curva cúbica necessita de pelo menos 4 pontos de controles para poder ser calculada. Caso queira-se obter outra curva a patir do último ponto fornecido, é necessário adicionar mais três pontos de controle ao ambiente.")
	#Condição que verifica se a tecla ESC foi pressionada. Se a condição for verdadeira, o programa é encerrado.
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()

#Função para calcular manualmente o resultado da multiplicação entre matrizes.
func multiplicacao_de_matrizes(matriz1, matriz2):
	var linhas1 = matriz1.size()
	var linhas2 = matriz2.size()
	var colunas1 = matriz1[0].size()
	var colunas2 = matriz2[0].size()
	var matriz_final = []
	var linha_da_matriz = []
	for linha in range(linhas1):
		linha_da_matriz = []
		for coluna in range(colunas2):
			linha_da_matriz.append(0)
		matriz_final.append(linha_da_matriz)
	for linha in range(linhas1):
		for coluna in range(colunas2):
			for indice in range(colunas1):
				matriz_final[linha][coluna] += matriz1[linha][indice] * matriz2[indice][coluna]
	print(matriz_final)
	return matriz_final
