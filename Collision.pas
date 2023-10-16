unit Collision;

interface

uses sdl2,sdl2_image, BreakOut_Type, changements, initialisation;

procedure brickCollision (var balle:def_balle; var Collision : boolean;ligne:string; var case_ou_non : Niveau; renderer:PSDL_Renderer; var images : Tab_Brick);
procedure CollisionBarre(var balle:def_balle;Barre:def_barre);
Procedure ToucheMur(var balle:def_balle);	
procedure Void( var balle:def_balle;var vie: integer;barre : def_barre; var depart : boolean);

implementation

procedure brickCollision (var balle:def_balle; var Collision : boolean;ligne:string; var case_ou_non : Niveau; renderer:PSDL_Renderer; var images : Tab_Brick);


var i,j:integer;

begin
collision:=false;

for j:=1 to 3 do
 begin

    for i:=1 to length(ligne) do 
    begin

     if case_ou_non[i][j]>0 then
  begin 
 if ((balle.X+balle.Xdirection)<=i*ImageWidth) and (balle.X+balle.Xdirection+balle.taille>=i*ImageWidth-ImageWidth) and(balle.Y<=balle.taille+j*ImageHeight+ImageHeight) and (balle.Y>=j*ImageHeight)then
 begin
  collision:=true;
  balle.Xdirection:=-balle.Xdirection;
 
effacer_brick(i,j, case_ou_non , images , renderer );
 
end;
 if (balle.X<=i*ImageWidth) and (balle.X+balle.taille>=i*ImageWidth-ImageWidth) and(balle.Y+balle.Ydirection<=balle.taille+j*ImageHeight+ImageHeight) and (balle.Y+balle.Ydirection>=j*ImageHeight)then
 begin
  collision:=true;
  balle.Ydirection:=-balle.Ydirection;

  effacer_brick(i,j, case_ou_non , images , renderer );
   
end;
 end;

 end;
 end;end;
 
 

 
procedure CollisionBarre(var balle:def_balle;barre:def_barre);

begin
if (balle.Y>=(ScreenHEIGHT-barre.hauteur-balle.taille)) and (balle.X>= Barre.X-balle.taille ) and (balle.X<= barre.X+barre.largeur) then
   
       balle.YDirection:=-5;    
end;

procedure Void(var balle:def_balle;var vie:integer; barre:def_barre;var depart:boolean);

begin
 If balle.Y>=ScreenHEIGHT-balle.taille Then 
   begin
   perte_vie(vie);
   
   initialise_balle(balle,barre,depart);
   
   end;
end;

Procedure ToucheMur(var balle:def_balle);	

begin
  If balle.X>=ScreenWidth-balle.taille Then 
   begin
   balle.XDirection:=-5 ;
 
   end;
   If balle.X<=0 Then
   begin
   balle. XDirection:=5;
 

end;
 
   If balle.Y<=0 Then
   begin
    balle.YDirection:=-balle.Ydirection;
   
    end;

end;

end.
