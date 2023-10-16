Program principal;

uses
  SDL2,
  SDL2_image,BreakOut_Type,Collision,Changements,Initialisation,afficher,verification;

var
  window: PSDL_Window;
  renderer: PSDL_Renderer;
  
  case_ou_non : Niveau;
  quit, depart: Boolean;
   j,vie :integer;
  ligne: string;
   barre : def_barre;
  event : TSDL_Event;
  images : Tab_brick; 
	balle : def_balle;

procedure Cleanup;
begin
for j:= 1 to 3 do 
 
    SDL_DestroyTexture(images[j]);

  IMG_Quit;
  SDL_DestroyRenderer(renderer);
  SDL_DestroyWindow(window);
  SDL_Quit;
end;






procedure mouvement ( var Barre:def_barre; var balle: def_balle);

var collision : boolean;

begin
brickCollision(balle,Collision,ligne,case_ou_non , renderer, images );
ToucheMur(balle);

CollisionBarre(balle,barre);
Void(balle,vie,barre,depart);
 
 
   balle.X:=balle.X+balle.XDirection;
    balle.Y:= balle.Y+balle.Ydirection;
    end;
  
    


procedure processKey ( key : TSDL_KeyboardEvent ; var Barre : def_barre );
begin
case key . keysym . sym of
SDLK_LEFT : begin

if barre.X >0 then
Barre.X := Barre.X - barre.hauteur;
end;
SDLK_RIGHT : begin

if Barre.X <= ScreenWidth-barre.largeur then
Barre.X := Barre.X + barre.hauteur;
end;

end;
end;

procedure init_tout(var vie:integer ;var balle: def_balle;var Barre:def_barre; var quit:boolean;var ligne:string;var  case_ou_non : Niveau;var window: PSDL_Window; var renderer:PSDL_Renderer; var images:Tab_Brick);

begin
init_var(vie,Barre,quit,ligne, case_ou_non);
Initialize_solo(ligne,window ,renderer,images, case_ou_non, quit, balle,barre);

end;

begin
Randomize();
init_tout(vie,balle,Barre,quit,ligne, case_ou_non,window ,renderer,images);
 initialise_balle(balle,barre,depart);
 Render(ligne ,Barre , renderer,  images, balle,case_ou_non);

  while not quit do
  begin
   
  attendre_action(balle,depart);
 
    SDL_Delay(16); // Limite de la fréquence d'images à environ 60 FPS
    SDL_PollEvent ( @event );
if event . type_ = SDL_KEYDOWN then
processKey ( event.key , Barre );
mouvement(Barre,balle);
	Render(ligne ,Barre , renderer,  images, balle,case_ou_non);
	verif_fin(vie,case_ou_non,quit);
	end;
  

  Cleanup;
end.
