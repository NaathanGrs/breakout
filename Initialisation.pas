unit Initialisation;

interface
uses sdl2,sdl2_image, BreakOut_Type;

procedure Initialize_solo(var ligne: string; var window: PSDL_Window; var  renderer: PSDL_Renderer;var images: Tab_Brick;var  case_ou_non : Niveau; var quit :boolean; var balle: def_balle;var barre:def_barre);
procedure init_var(var vie :integer; var Barre:def_barre ;var quit : boolean; var ligne:string; var case_ou_non : Niveau);
procedure initialise_balle (var balle : def_balle;barre:def_barre;var depart:boolean);
implementation

procedure Initialize_solo(var ligne: string; var window: PSDL_Window; var renderer: PSDL_Renderer;var images: Tab_Brick; var case_ou_non : Niveau; var quit :boolean; var balle: def_balle;var barre:def_barre);
var
 
  fichier: TextFile; // Variable de fichier texte
  var i,j :integer;
begin
SDL_Init(SDL_INIT_VIDEO);
SDL_CreateWindowAndRenderer ( ScreenWIDTH , ScreenHEIGHT , SDL_WINDOW_SHOWN , @window , @Renderer );

  // Initialiser la bibliothèque SDL2_image
  IMG_Init(IMG_INIT_PNG);
  Assign(fichier, 'Niveaux/grille_brique.txt'); // Remplacez 'mon_fichier.txt' par le nom de votre fichier
  Reset(fichier); 
    

  j:=1;
  while not EOF(fichier) do
  begin
  Readln(fichier, ligne); // Lit une ligne du fichier
  writeln(ligne);

  
  for i := 1 to length(ligne) do
  begin
  case_ou_non[i][j]:=0;
  case ligne[i] of
  '1' : 
  begin
   
    case_ou_non[i][j]:=1;
    
  end;
   '2' : begin
   
    case_ou_non[i][j]:=2;
    
  end;
   '3' : begin
    
    case_ou_non[i][j]:=3;

  end;
  
end;
end;
  j:=j+1;
end;
images[1]:=IMG_LoadTexture ( Renderer , 'ressources/brique_bleu.jpg');
images[2]:=IMG_LoadTexture ( Renderer , 'ressources/brique_jaune.jpg');
images[3]:=IMG_LoadTexture ( Renderer , 'ressources/brique_rouge.jpg');

Balle.design_balle := IMG_LoadTexture ( Renderer , 'ressources/rouen.jpg');
barre.design_barre := IMG_LoadTexture (Renderer, 'ressources/barre.jpg');
  quit := False;
end;

procedure init_var(var vie : integer ; var Barre: def_barre ;var quit : boolean;var ligne:string;var case_ou_non : Niveau);

begin
vie := 3 ;
Barre.X := (ScreenWIDTH - barre.largeur) div 2;
barre.largeur:=largeur_barre;
barre.hauteur:=hauteur_barre;
quit := false;




end;

procedure initialise_balle (var balle : def_balle;barre:def_barre;var depart:boolean);

	
begin


balle.taille:=taille_balle;
balle.X:= barre.X +( barre.largeur + balle.taille ) div 2;
	balle.Y:=ScreenHEIGHT - barre.hauteur-balle.taille;
	balle.Xdirection:=0;
	balle.Ydirection:=0;
	depart:=false;

end;

end.





