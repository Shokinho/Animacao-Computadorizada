# Geração de Animações Utilizando o Espectro Sonoro

<div align="center">
    <img width="" src="https://github.com/user-attachments/assets/cbf4c3f4-7120-4a52-84c7-678090d6f4bf" alt="Barra roxa com laços lilás envoltos da mesma e com correntes e pingentes roxos balançando."/>
</div>

## Equipe

<ul type="circle">
    <li>Caroline Andressa dos Santos Moro</li>
</ul>

## Descrição do projeto

<p align="justify">O projeto trata-se de um programa desenvolvido como um exercício da disciplina de Animação Computadorizada, no qual o modelo selecionado tem os valores dos alvos de sua blend shape modificados usando os valores das amplitudes da música selecionada, produzindo uma animação com base no espectro sonoro da referida música.</p>

## Estrutura do projeto

<div align="center">

|Arquivo|Descrição|
|-------|---------|
|espectro_sonoro.gd|Lê as informações do espectro sonoro da música e modifica os pesos dos alvos da blend shape do modelo selecionado.|

</div>

## Informações técnicas

<ul type="circle">
    <li><strong>Engine:</strong> Godot Engine 4.4.1-stable</li>
    <li><strong>Linguagem:</strong> GDScript</li>
    <li><strong>Dependências:</strong> Nenhuma</li>
    <li><strong>Plataforma-alvo:</strong> Windows</li>
    <li><strong>Modelagem:</strong> Autodesk Maya 2025 (Plano de Estudante)
</ul>

## Checklist de requisitos

- [x] Criação de um blade shape e de seus respectivos alvos no modelo selecionado
- [x] Leitura das amplitudes de uma determinada faixa de frequências da música selecionada em tempo real
- [x] Mudança dos pesos dos alvos em tempo real de acordo com as amplitudes do espectro sonoro da música selecionada

## Link para a build

Em breve.

## Referências e/ou créditos

<ul type="circle">
    <li>Modelo da água-viva - https://sketchfab.com/assetfactory</li>
    <li>Música Ghibli Harp - https://pixabay.com/pt/users/konstantinpazuzustudio-53945084/</li>
</ul>

## Comentários finais

<p align="justify">É possível mudar a música usada para modificar os pesos dos alvos da blend shape do modelo selecionado Para isto, é necessário clonar a pasta deste trabalho e abrí-lo como um projeto do motor Godot. Ao abrir o projeto, clique com o botão direito em cima do arquivo paozinho.mp3, o qual está localizado no canto inferior esquerdo da tela, e selecione a opção Apagar à Direita. Em seguida, copie e cole a música requerida dentro da pasta do projeto e aguarde a importação do arquivo. Por último, selecione o nó Música, localizado no canto superior esquerdo da tela, e carregue o arquivo da música requerida na propriedade Stream do nó, localizado no canto superior direito da tela. É importante dizer que são lidos apenas os formatos de arquivo WAV, Ogg e MP3, com algumas exceções envolvendo os formatos de arquivo MP1 e MP2.<p>
