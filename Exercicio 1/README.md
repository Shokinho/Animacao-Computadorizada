# Trajetória com Curva Paramétrica

<div align="center">
    <img src="https://github.com/user-attachments/assets/7225ff23-698e-4d9a-93a1-eb4a1abafe2b" alt="Ramos de flores rosas com pingentes de corações rosas"/>
</div>

## Equipe

<ul type="circle">
    <li>Caroline Andressa dos Santos Moro</li>
</ul>

## Descrição do projeto

<p align="justify">O projeto trata-se de um programa desenvolvido como um exercício da disciplina de Animação Computadorizada, no qual é possível visualizar a interpolação de um determinado conjunto de pontos de controle decorrente da utilização de curvas lineares e cúbicas, sendo que esta última refere-se a curva de Bézier. A proposta do ambiente é que o usuário forneça um caminho que leve a borboleta até as flores.</p>

## Estrutura do projeto

<div align="center">

|Arquivo|Descrição|
|-------|---------|
|curvas_parametricas.gd|Define a criação dos pontos intermediários mediante a utilização das curvas lineares e das curvas cúbicas.|

</div>

## Informações técnicas

<ul type="circle">
    <li><strong>Engine:</strong> Godot Engine 4.4.1-stable</li>
    <li><strong>Linguagem:</strong> GDScript</li>
    <li><strong>Dependências:</strong> Nenhuma</li>
    <li><strong>Plataforma-alvo:</strong> Windows</li>
</ul>

## Checklist de requisitos

- [x] Implementação e manipulação manual dos pontos de controles
- [x] Visualização da curva linear
- [x] Visualização da curva cúbica
- [x] Animação da borboleta percorrendo a trajetória proposta
- [x] Troca em tempo real da visualização entre a curva linear e a curva cúbica

## Link para a build

<div>
    <img width="16" alt="Clipe de papel" src="https://github.com/user-attachments/assets/64c9419a-1a16-4bb6-bdfd-3898370a9e2b" />
    <a href="https://github.com/Shokinho/Animacao-Computadorizada/releases/tag/Exerc%C3%ADcio_1">Link</a>

</div>

## Referências e/ou créditos

<ul type="circle">
    <li>Modelo da borboleta - https://sketchfab.com/assetfactory</li>
    <li>Modelo das flores - https://sketchfab.com/assetfactory</li>
    <li>Video sobre interpolação linear - https://www.youtube.com/watch?v=eTI2NQ6MCQk</li>
    <li>Livro sobre a matemática usada na programação de jogos e na computação gráfica - Mathematics for 3D game programming and computer graphics de Eric Lengyel</li>
    <li>Ícones dos README.md do repositório - https://www.flaticon.com/authors/magnific</li>
</ul>

## Comentários finais

<p align="justify">A inserção de pontos de controle no ambiente do programa, só é possível via o editor do Godot Engine, portanto, é necessário o usuário baixar o motor Godot caso queira adicionar, deletar ou manipular os pontos de controle. Para colocar um novo ponto de controle no ambiente, instancie a cena chamada Ponto_de_controle no nó principal da cena Curvas_parametricas. No entanto, é importante ressaltar que a ordem dos pontos de controle é lida de cima para baixo na árvore de nós presente no editor e que a posição em y dos pontos de controle deve constar como 0.15 para que não haja problemas na visualização das curvas paramétricas.<p>
