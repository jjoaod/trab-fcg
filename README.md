**UNIVERSIDADE FEDERAL DO RIO GRANDE DO SUL**  
**Relatório \- Projeto Final**  
**Fundamentos de Computação Gráfica**  
**Departamento de Informática Aplicada**  
**João Vitor Moreira Dias \- 303338**

**1 .  Introdução**  
	O seguinte trabalho é o projeto final da cadeira de computação gráfica, no qual desenvolvi uma aplicação de um jogo de caça de coelhos. A aplicação aborda assuntos de mapeamento de texturas para objetos, iluminação, curvas de bézier e outros conceitos importantes na área de computação gráfica.

**2 .   Descrição das atividades**  
	A aplicação pode ser dividida em seis partes importantes: movimento dos coelhos, outros animais da cena, função de tiro, lógica de colisões, cenário e menu.

**2.1 . Movimentos dos coelhos**  
	Os coelhos se movem em torno das vacas na cena. O número de coelhos é definido pelo usuário no menu principal. Cada coelho acertado pelo usuário é um ponto somado para o usuário.  
![][image1]

**2.2 . Outros animais da cena**   
	As vacas ficam em uma fila e não se movem durante a execução. Cada vaca acertada é menos um ponto para o usuário.  
	Caso o jogador acerte o cachorro, o jogo acaba, com a derrota do usuário.  
![][image2]

**2.3 . Função de tiro**  
	Quando o usuário atira, a aplicação coloca uma esfera na tela, a qual move-se na direção do vetor da câmera.  
![][image3]

**2.4 . Lógica de colisões**  
	As colisões são feitas através de dois testes de colisões, teste esfera com esfera e teste esfera com cilindro. O teste esfera com esfera foi utilizado para a colisão com os coelhos, por se adequar melhor ao formato desse objeto. O teste esfera com cilindro foi utilizado para as colisões com o cachorro. O teste de colisão do tiro com as vacas não foi implementado devido a questões de tempo de desenvolvimento.

**2.5 . Cenário**  
	O cenário consiste em um cubo com seis faces sendo uma delas o chão e as outras cinco responsáveis pelo céu. Toda face do céu possui brilho próprio, para evitar sombreamento em uma das faces. Todos os objetos, exceto o coelho, utilizam o modelo de iluminação Blinn-Phong.  
![][image4]

**2.6  . Menu**  
	No mesmo o usuário pode selecionar o número de coelhos, o teste de interpolação e se a câmera é livre ou *look-at.*  
*![][image5]*

**3\.   Uso de inteligências artificiais**  
	Utilizei a inteligência artificial Deepseek para auxiliar no desenvolvimento da aplicação. Essa foi utilizada para desenvolver o modelo de interpolação de Gouraud no vertex shader, o menu e outros códigos triviais, Inicialização de arranjos, parte da função de animação, refatoração e debug. Em geral acredito que a utilização da IA foi útil apenas quando enviado o arquivo no qual estava desenvolvendo e para códigos triviais, já que a IA não possui a informação visual da cena. Além disso, penso que a IA consegue facilitar a familiarização com linguagens de programação pouco familiarizadas pelo desenvolvedor, já que pode aumentar o nível de abstração para o desenvolvimento, não fazendo necessário conhecer detalhes triviais da linguagem de programação. Segue uma imagem com a interpolação de Gouraud, implementado em grande parte pela Inteligência Artificial.  
![][image6]

**4\.   Manual para compilação e execução**  
Para compilar Instale o MinGW, e tenha instalado as bibliotecas GLFW e GLAD. De  
preferência utilize o Code Blocks ou outro IDE para fazer o processo de compilação e execução automático. Também pode ser utilizado o comando : *g++ src/main.cpp \-o main \-Iinclude \-Llib \-lglfw3 \-lopengl32 \-lgdi32 \-std=c++11.* Utilize o código presente em versão\_final.zip/cod\_trab/src no github. O último commit foi realizado através de um arquivo *zip*  devido ao o git ter sido inicialmente mal configurado.

**5\.   Tutorial de como jogar**

* Segure o botão principal do mouse para mover a câmera  
* W, S, E, A e D para o movimento do personagem.  
* F para disparar a arma


**6\. Conclusão**  
	O trabalho serviu muito bem para colocar em prática os conceitos da disciplina de uma forma conjunta, indo além dos laboratórios, os quais cada conceito era abordado separadamente. Além disso, pode-se entregar praticamente todos os requisitos, faltando somente um dos três testes de intersecção.
