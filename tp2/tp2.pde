//boton inicio
int tamXBotonI;
int tamYBotonI;

float posXBotonI;
float posYBotonI;

PFont miFuente;
PImage miImagen;
PImage imagenPantalla2;
PImage imagenPantalla3;
PImage imagenPantalla4;
PImage imagenPantalla5;   
PImage imagenPantalla6;

float posYTexto2;
float posYImagen2;
float opacidadMap;
float opacidadTexto3;
float posYTexto3;
float opacidadP4 = 255;
float opacidadP5;

float posYImagen5;
float posYTexto5;
float posYPregunta;
float posXImagen6;
float posXTexto6;
float posXFijadaBoton;

float posXTexto;
float posYTexto;
int estado;
int contador;
int marcaDeTiempo;
float posXBotonR, posYBotonR;
float tamXBotonR, tamYBotonR;

void setup() {
  size(640, 480);

  miFuente= loadFont("Georgia-BoldItalic-48.vlw");
  posXTexto=width/2;
  posYTexto=45;
  textFont(miFuente);


  miImagen = loadImage ("PLL.jpg");                                                      //imagenes
  imagenPantalla2 = loadImage ("desaparicion.jpg");
  imagenPantalla3 = loadImage ("mensajeA.jpg");
  imagenPantalla4 = loadImage ("protagonistas.jpg");
  imagenPantalla5 = loadImage("misterio.jpg");
  imagenPantalla6 = loadImage("finall.jpeg");

  
  estado=1; //boton inicio
  tamXBotonI=200;
  tamYBotonI=50;
  posXBotonI= width/3 - tamXBotonI/2 + 100;
  posYBotonI = height - height/5 - tamYBotonI/2 + 30;
  contador=0;
  posYTexto3 = height/2 + 80;
  tamXBotonR = 160;  //botón reiniciar pantalla 6
  tamYBotonR = 45;
  posXBotonR = width/2 - tamXBotonR/2;
  posYBotonR = height/2 + 140;
}

void draw() {
  contador = frameCount - marcaDeTiempo;
  background (255);
  fill(0);  // color letras

  //pantalla 1
  if (estado==1) {
    image(miImagen, 0, 80, width, 400);
    fill(0);
    textSize(38);
    textAlign(CENTER,CENTER);
    text("¿Conoces pretty little liars?", posXTexto, posYTexto);
    
    if (mouseX >= posXBotonI && mouseX <= posXBotonI + tamXBotonI && mouseY >= posYBotonI && mouseY <= posYBotonI +tamYBotonI) {  //condicional
      fill(200, 0, 0);
    } else {
      fill(255);
    }
    rect(posXBotonI, posYBotonI, tamXBotonI, tamYBotonI, 10); 

    fill(0);
    textSize(18);
    textAlign(CENTER, CENTER);
    text("te invito a\nconocerla", posXBotonI+tamXBotonI/2, posYBotonI+tamYBotonI/2);  //barra izq para separar renglon
  }   
  // pantalla 2
  else if (estado==2) {
    background(0); 
    image(imagenPantalla2, 321,posYImagen2,321, 480);
    stroke(200, 0, 0);  //linea roja
    strokeWeight(4);
    line(320, 0, 320, height);
    noStroke();

  if (contador<=300) {
      posYTexto2= map(contador, 0, 300, height+200, height/2);
      posYImagen2=map(contador,0,300,height+200,0);
    }
    fill(255); //letras blancas
    textSize(20);
    textAlign(RIGHT, CENTER);
    text("En Rosewood nada \nes lo que parece. \nTodo comienza con \nla misteriosa desaparición \nde Allison. \nDespués de esa noche, \nempiezan a llegar mensajes \nanónimos firmados por “A”, \nalguien que conoce \nlos secretos\n de todos.", 320, posYTexto2);

    if (contador>550) {    //transicion tiempo
      estado=3;
      marcaDeTiempo=frameCount;  //reseteo
    }
    }                        
  //pantalla 3
  else if (estado==3) {
    background(15);
    
  if (contador<= 150) {
    opacidadMap = map(contador,0,150,0,255);
    } else {
      opacidadMap=255;
    }
    //textos
    tint(255,opacidadMap);   //aparece lentamente
    image(imagenPantalla3,0,0,width,height);
    noTint();
    fill(0,150);
    rect(0,0,width,height);
    fill(255,opacidadMap);
    textSize(18);
    textAlign(CENTER, TOP);
    text("las 4 protagonistas de la serie, amigas de alison, \nse reunen tras el funeral...\n y sus telefonos reciben un mensaje al mismo tiempo", width/2, 20);
   
  if (contador > 150) {
      if (contador <= 250) {
        opacidadTexto3= map(contador, 150, 250, 0, 255);
        posYTexto3 = map(contador, 150, 250, height, height -100); 
      } else {
        opacidadTexto3 = 255;
        posYTexto3 = height-100; 
      }
      fill(230,0,0,opacidadTexto3);
      textSize(28);
      textAlign(CENTER,CENTER);
      text("''sigo aqui perras, y lo se todo\n -A''", width/2,posYTexto3);
      }
  if (contador > 600) {
      estado = 4;
      marcaDeTiempo = frameCount;
     }
     }
  
//pantalla 4
else if (estado==4){
   background(10);
   
   if (contador<=100){                  //tiempo y opacidad
     opacidadP4 = map (contador, 0,100,0,255);
     }
   else if (contador>100 && contador<=450){
     opacidadP4 = 255;
     }
   else if (contador>450 && contador<=550){
     opacidadP4 = map (contador,450,550,255,0);
     }
    //textos 
   tint(255,opacidadP4);
   image(imagenPantalla4,0,0,640,480);
   noTint();
   fill(255,opacidadP4);
   textSize(16);
   textAlign(CENTER, TOP);
   text("Aria, Spencer, Hanna y Emily ocultan secretos oscuros... \nsecretos que solo Alison sabia",width/2,20);
   fill(230,0,0, opacidadP4);
   textSize(22);
   textAlign(CENTER, CENTER);
   text("¿Podran descubrir quien las esta \nvigilando y acosando?", width/2,height-50);
   
   if (contador>550){
     estado=5;
     marcaDeTiempo=frameCount;
   }
   }
   
  // pantalla 5 
  else if (estado==5){
    background(0); 

    if (contador <= 120){
      opacidadP5 = map(contador, 0, 120, 0, 255);
      posYImagen5 = map(contador, 0, 120, -480, 0);
      posYTexto5 = map(contador, 0, 120, -200, height/2 - 30);
    } 
    else if (contador > 120 && contador <= 480){
      opacidadP5 = 255;
      posYImagen5 = 0;
      posYTexto5 = height/2 - 30;
    } 
    else if (contador > 480 && contador <= 600){
      opacidadP5 = map(contador, 480, 600, 255, 0);
    }

    tint(255, opacidadP5);
    image(imagenPantalla5, 0, posYImagen5, 320, 480); 
    noTint();
    fill(150, 0, 0, 30); 
    rect(0, posYImagen5, 320, 480);
    fill(255, opacidadP5);
    textSize(18);
    textAlign(LEFT, CENTER);
    text("Nadie está a salvo en \nRosewood. Las sospechas \ncaen sobre todos...\n\nIncluso sobre las \npersonas que más \nquieres.", 350, height/2 - 30);
    fill(230, 0, 0, opacidadP5);
    textSize(34); 
    textAlign(RIGHT, BOTTOM);
    posYPregunta = map(posYTexto5, -200, height/2 - 30, -50, height - 40);
    text("¿Quién es -A?", width - 20, posYPregunta);

    if (contador > 600) {
      estado = 6;
      marcaDeTiempo = frameCount;
      posXImagen6 = -640;
      posXTexto6 = -640;
    }
    }
 //pantalla 6
 else if (estado==6){
    background(0);
    if (contador <= 100) {
      posXImagen6 = map(contador, 0, 100, -640, 0);
      posXTexto6 = map(contador, 0, 100, -640, width/2);
    } else {
      posXImagen6 = 0;
      posXTexto6 = width/2;
    }
     
    image(imagenPantalla6, posXImagen6, 0, width,height); 
     
    fill(230, 0, 0);
    textSize(40);
    textAlign(CENTER, CENTER);
    text("PRETTY LITTLE LIARS", posXTexto6, posYBotonR - 40);
    posXFijadaBoton = map(posXTexto6, -640, width/2, -tamXBotonR, width/2 - tamXBotonR/2);
    dibujarBotonReiniciar();
    
    fill(255);
    textSize(24);
    textAlign(CENTER, CENTER);
    text("- A", posXTexto6, posYBotonR + tamYBotonR + 25);
  }
  }
void dibujarBotonReiniciar() {
  if (mouseX >= posXFijadaBoton && mouseX <= posXFijadaBoton + tamXBotonR && mouseY >= posYBotonR && mouseY <= posYBotonR + tamYBotonR) {
  fill(200, 0, 0); 
  } else {
    fill(40);
  }
  stroke(230, 0, 0);
  strokeWeight(2);
  rect(posXFijadaBoton, posYBotonR, tamXBotonR, tamYBotonR, 8);
  noStroke();
  fill(255);
  textSize(16);
  textAlign(CENTER, CENTER);
  text("Volver a ver",posXFijadaBoton + tamXBotonR/2,posYBotonR + tamYBotonR/2);
}        
void mouseClicked() {
  if (estado==1) {  
    if (mouseX >= posXBotonI && mouseX <= posXBotonI + tamXBotonI && mouseY >= posYBotonI && mouseY <= posYBotonI + tamYBotonI) {
      estado=2;
      marcaDeTiempo=frameCount; 
      posYTexto2= height+150;
      posYImagen2=height+150;
     }
     }
  else if (estado == 6) {  
    float posXFijadaBoton = width/2 - tamXBotonR/2;
    if (mouseX >= posXFijadaBoton && mouseX <= posXFijadaBoton + tamXBotonR && mouseY >= posYBotonR && mouseY <= posYBotonR + tamYBotonR) {
      estado = 1;               
      marcaDeTiempo = frameCount; 
     }
     }
     }
    
