unit afficher;

interface

uses sdl2,sdl2_image, BreakOut_Type;

procedure Render(ligne : string; Barre :def_barre; renderer:PSDL_Renderer; var   images:Tab_Brick; balle:def_balle;case_ou_non : Niveau);

implementation


procedure Render(ligne : string; Barre:def_barre; renderer:PSDL_Renderer;var  images:Tab_Brick;balle: def_balle;case_ou_non : Niveau);
var pos_rect,destination_rect,barre_rect : TSDL_RECT;
var i, j :integer;
begin
  SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
  SDL_RenderClear(renderer);


for j:=1 to 3 do
begin
  for i := 1 to length(ligne) do
  begin

 pos_rect .x := i*ImageWidth-ImageWidth;
pos_rect .y :=15+j*ImageHeight;
pos_rect .w := ImageWidth ;
pos_rect .h := ImageHeight ;
    SDL_RenderCopy(renderer, images[case_ou_non[i][j]], nil, @pos_rect);
  end;
  end;

{ Choix de la position et taille de l ’ element a afficher }
destination_rect .x := balle.X;
destination_rect .y :=balle.Y;
destination_rect .w := balle.taille ;
destination_rect .h := balle.taille;
barre_rect .x := Barre.X  ;
barre_rect .y :=(ScreenHEIGHT-barre.hauteur);
barre_rect .w := barre.largeur ;
barre_rect .h := barre.hauteur ;
SDL_RenderCopy ( Renderer , balle.design_balle , nil , @destination_rect );
SDL_RenderCopy ( Renderer , barre.design_barre , nil , @barre_rect );
  SDL_RenderPresent(renderer);
end;

end.
