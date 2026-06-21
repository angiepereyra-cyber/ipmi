PImage imgReferencia;                                              
int anchoPanelImagen;                                            
int filas;                                                       
int columnas;                                                      
float tamCeldaX;                                                 
float tamCeldaY;                                                   
float amplitudOffset;                                              
float grosorLinea;                                                
int angulo;                                                      
int preMouseX;                                                    
boolean modoRandom;                                            
// Variables para reiniciar el programa
float amplitudOffsetOriginal;
float grosorLineaOriginal;
int filasOriginal;
int columnasOriginal;
int anguloOriginal;
int origenX;                                                        

void setup() {
  size(800, 400);                                                   
  imgReferencia = loadImage("14.jpg");                              
  anchoPanelImagen = width/2;                                       
  origenX = anchoPanelImagen;                                     
  filas = 8;                                                        
  columnas = 10;                                                    
  amplitudOffset = 25;                                              
  grosorLinea = 4;                                                  
  angulo = 0;                                                      
  modoRandom = false;                                               
  // Guardo valores originales para reiniciar después
  filasOriginal = filas;
  columnasOriginal = columnas;
  amplitudOffsetOriginal = amplitudOffset;
  grosorLineaOriginal = grosorLinea;
  anguloOriginal = angulo;

  imageMode(CORNER);
  textSize(11);
}

void draw() {
  background(245);                                                 
  amplitudOffset = map(mouseX, origenX, width, 0, 60);               
  amplitudOffset = constrain(amplitudOffset, 0, 60);                 
  grosorLinea = map(mouseY, 0, height, 1, 10);
  grosorLinea = constrain(grosorLinea, 1, 10);
  recalcularTamCelda();                                            
  dibujarPanelReferencia();      
  grilla(columnas, filas);                            
}
// FUNCION QUE RETORNA VALOR
float calcularOffsetFila(int fila, float amplitud) {
  float offset;
  if (modoRandom == true) {                                          
    offset = random(-amplitud, amplitud);
  } else {                                                          
    if (fila % 2 == 0) {
      offset = amplitud;
    } else { 
      offset = 0;
    }
    }                              
  return offset;                                                     
}
// FUNCION QUE RETORNA VALOR
boolean esPar(int valor1, int valor2) {                              
  if ((valor1 + valor2) % 2 == 0) {
    return true;
  } else {
    return false;
  }
}
// FOR ANIDADOS
void grilla(int cantColumnas, int cantFilas) {       // Primer FOR 
  for (int i = 0; i < cantFilas; i++) {
    float offsetFila = calcularOffsetFila(i, amplitudOffset);
    float posY = i * tamCeldaY;                                       
    for (int j = 0; j < cantColumnas; j++) {
      float posX = origenX + j * tamCeldaX + offsetFila;
      dibujarCelda(posX, posY, j);
    }                                                               
    dibujarLineaSeparadora(posY);
  }
}
// FUNCION QUE NO RETORNA
void dibujarCelda(float posX, float posY, int columna) {            
  if (esPar(columna, 0) == true) {
    fill(0);
  } else {
    fill(255);
  }
  push();                                                             
  translate(posX + tamCeldaX/2,
            posY + tamCeldaY/2);                                    
  rotate(radians(angulo));
  rectMode(CENTER);
  noStroke();
  rect(0, 0, tamCeldaX, tamCeldaY);
  pop();
}
// FUNCION QUE NO RETORNA
void dibujarLineaSeparadora(float posY) {                              
float centroX = origenX + columnas * tamCeldaX / 2;                   
  float distanciaMouse = dist(mouseX,mouseY,centroX,posY);         
  float opacidad = map(distanciaMouse,0,width,255,60);
  opacidad = constrain(opacidad, 60, 255);
  stroke(120, opacidad);
  strokeWeight(grosorLinea);
  line(origenX,
       posY,
       origenX + columnas * tamCeldaX,
       posY);
  noStroke();
}
                                                                      
void recalcularTamCelda() {
  float anchoDisponible = width - origenX;
  tamCeldaX = anchoDisponible / columnas;
  tamCeldaY = (float)height / filas;
}                                                                      
void dibujarPanelReferencia() {
  fill(230);
  noStroke();
  rect(0, 0, anchoPanelImagen, height);
  if (imgReferencia != null) {
    image(imgReferencia,0,0,anchoPanelImagen,height);
  }                                                                   
  stroke(180);
  line(anchoPanelImagen, 0,anchoPanelImagen,height);
  noStroke();
}
// EVENTOS                                                           
void mousePressed() {
  preMouseX = mouseX;
}                                                                       
void mouseDragged() {
  if (mouseX > preMouseX) {
    angulo++;
  } else {
    angulo--;
  }
  preMouseX = mouseX;
}                                                                       
void keyPressed() { 
  if (key == ' ') {                                                 
    modoRandom = !modoRandom;
  }
  // R reinicia el programa
  else if (key == 'r' || key == 'R') {
    reiniciar();
  }                         
  else if (keyCode == UP) {                                             
    if (filas < 20) {
      filas++;
  }
  }
  else if (keyCode == DOWN) {
    if (filas > 2) {
      filas--;
  }
  }
  else if (keyCode == RIGHT) {
    if (columnas < 20) {
      columnas++;
  }
  }
  else if (keyCode == LEFT) {
    if (columnas > 2) {
      columnas--;
  }
  }
}
void reiniciar() {                                                      
  filas = filasOriginal;
  columnas = columnasOriginal;
  amplitudOffset = amplitudOffsetOriginal;
  grosorLinea = grosorLineaOriginal;
  angulo = anguloOriginal;
  modoRandom = false;
}
