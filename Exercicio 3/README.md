# Deformações com o Uso de Blend Shapes

<div align="center">
    <img width="400" src="https://github.com/user-attachments/assets/e9613820-4358-4c93-bdd3-f119c18e776c" alt="Faixa roxa com laços roxos nas pontas e duas correntes roxas com um pingente roxo no meio."/>
</div>

## Equipe

<ul type="circle">
    <li>Caroline Andressa dos Santos Moro</li>
</ul>

## Descrição do projeto

<p align="justify">O projeto trata-se de um programa desenvolvido como um exercício da disciplina de Animação Computadorizada, no qual é permitido mudar os pesos de cada um dos alvos da blend shape presente no modelo e reproduzir uma animação baseada na interpolação entre os pesos atuais dos alvos e os pesos dos alvos fornecidos pelo usuário.</p>

## Estrutura do projeto

<div align="center">

|Arquivo|Descrição|
|-------|---------|
|blend_shapes.gd|Reproduz a animação baseada nos valores atuais dos alvos e nos valores dos alvos fornecidos pelo usuário.|

</div>

## Informações técnicas

<ul type="circle">
    <li><strong>Engine:</strong> Godot Engine 4.4.1-stable</li>
    <li><strong>Linguagem:</strong> GDScript</li>
    <li><strong>Dependências:</strong> Nenhuma</li>
    <li><strong>Plataforma-alvo:</strong> Windows</li>
    <li><strong>Modelagem e animação:</strong> Autodesk Maya 2025 (Plano de Estudante)
</ul>

## Checklist de requisitos

- [x] Criação de um blade shape e de seus respectivos alvos no modelo selecionado
- [x] Composição da animação inicial utilizando os alvos do blend shape do modelo selecionado
- [x] Reprodução da animação inicial ao programa ser aberto
- [x] Mudança dos pesos dos alvos em tempo real
- [x] Criação e reprodução da animação baseada nos valores atuais dos alvos e nos valores dos alvos fornecidos pelo usuário

## Link para a build

<div>
    <img width="16" alt="Clipe de papel" src="https://github.com/user-attachments/assets/64c9419a-1a16-4bb6-bdfd-3898370a9e2b" />
    <a href="https://github.com/Shokinho/Animacao-Computadorizada/releases/tag/Exerc%C3%ADcio_3">Link</a>

</div>

## Referências e/ou créditos

<ul type="circle">
    <li>Modelo da água-viva - https://sketchfab.com/assetfactory</li>
    <li>Documentação sobre o objeto Tween presente no motor Godot - https://docs.godotengine.org/en/latest/classes/class_tween.html</li>
    <li>Ícones dos README.md do repositório - https://www.flaticon.com/authors/magnific</li>
</ul>

## Comentários finais

<p align="justify">O usuário pode mudar cada um dos pesos dos alvos presentes na blend shape da água-viva por meio dos controles deslizantes. Ao pressionar a tecla Enter, será gerada e reproduzida uma animação com duração de 1 segundo, iniciando com os valores atuais dos pesos no primeiro quadro e terminando com os valores dos pesos fornecidos pelo usuário no último quadro.<p>
