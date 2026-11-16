# Pipeline de Geração de Personagem Animado por Esqueleto

<div align="center">
    <img width="800" src="https://github.com/user-attachments/assets/fbe428be-c995-4a5f-a317-5a3b63c1801f" alt="Laço roxo com brilho."/>
</div>

## Equipe

<ul type="circle">
    <li>Caroline Andressa dos Santos Moro</li>
</ul>

## Descrição do projeto

<p align="justify">O projeto trata-se de um programa desenvolvido como um exercício da disciplina de Animação Computadorizada, no qual foi feito o rigging e o skinning de um determinado modelo visando a criação de uma animação para o mesmo. Além disso, foi implementado uma interface para a reprodução das animações do modelo utilizando transições suaves em um motor.</p>

## Estrutura do projeto

<div align="center">

|Arquivo|Descrição|
|-------|---------|
|personagem.gd|Inicializa a máquina de estados do nó AnimationTree e reproduz as animações do modelo de acordo as teclas lidas.|

</div>

## Informações técnicas

<ul type="circle">
    <li><strong>Engine:</strong> Godot Engine 4.4.1-stable</li>
    <li><strong>Linguagem:</strong> GDScript</li>
    <li><strong>Dependências:</strong> Nenhuma</li>
    <li><strong>Plataforma-alvo:</strong> Windows</li>
    <li><strong>Rigging, Skinning e Animação:</strong> Autodesk Maya 2025 (Plano de Estudante)
</ul>

## Checklist de requisitos

- [x] Criação do esqueleto do modelo selecionado
- [x] Ajuste dos pesos dos ossos do modelo selecionado
- [x] Colocação das animações escolhidas no modelo selecionado
- [x] Implementação da máquina de estados para a reprodução das animações do modelo selecionado
- [x] Implementação da leitura de determinadas teclas para a reprodução das animações do modelo selecionado

## Link para a build

<div>
    <img width="16" alt="Clipe de papel" src="https://github.com/user-attachments/assets/64c9419a-1a16-4bb6-bdfd-3898370a9e2b" />
    <a href="https://github.com/Shokinho/Animacao-Computadorizada/releases/tag/Exerc%C3%ADcio_4">Link</a>
</div>

## Referências e/ou créditos

<ul type="circle">
    <li>Modelo da menina - https://sketchfab.com/charliewalls</li>
    <li>Animações de Mocap - https://www.mixamo.com/#/</li>
    <li>Ícones dos README.md do repositório - https://www.flaticon.com/authors/magnific</li>
</ul>

## Comentários finais

<p align="justify">Por motivos desconhecidos, foi necessário fazer um esqueleto manualmente para o modelo selecionado igual ao esqueleto do modelo exportado que continha as animações e um Retargeting para colocar as animações no modelo referido, visto que o Autorig da ferramenta utilizada não funcionou como o esperado. Além disso, devido ao modo como a máquina de estados foi feita e as funções utilizadas, não é possível reproduzir uma determinada animação mais de uma vez consecutivamente ao apertar sua referida tecla, ela só pode ser reproduzida novamente após a reprodução de outra animação distinta.<p>
