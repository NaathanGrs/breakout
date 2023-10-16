unit BreakOut_Type;

interface 

uses
  SDL2,
  SDL2_image;

const
  ScreenWidth = 825;
  ScreenHeight = 600;
  ImageWidth = 75;
  ImageHeight = 50;
  taille_balle = 15;
  hauteur_barre = 20;
  largeur_barre = 150;
  
Type Niveau = array[1..11,1..3] of integer;  

Type Tab_Brick = array[1..3] of PSDL_Texture;

type def_balle=record
x,y,Xdirection,Ydirection,taille : integer;
design_balle : PSDL_Texture;

end;

Type def_barre = record
X,hauteur,largeur:integer;
design_barre : Psdl_texture;
end; 



  implementation
  
  end.
