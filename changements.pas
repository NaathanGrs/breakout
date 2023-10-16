unit changements;


interface
uses sdl2,sdl2_image, BreakOut_Type;

procedure effacer_brick ( i,j:integer; var case_ou_non : Niveau; var images : Tab_Brick; renderer : PSDL_Renderer);
procedure perte_vie (var vie:integer);
procedure attendre_action (var balle:def_balle;var depart:boolean);

implementation

procedure effacer_brick ( i,j:integer; var case_ou_non : Niveau; var images : Tab_Brick;  renderer : PSDL_Renderer);

begin
writeln();
writeln(case_ou_non[i][j]);

if case_ou_non[i][j]>0 then
case_ou_non[i][j]:=  case_ou_non[i][j]-1;

writeln(case_ou_non[i][j]);
  
end;
    
    procedure perte_vie (var vie:integer);
    
    begin
    vie:=vie-1;
    
    end;

procedure attendre_action (var balle:def_balle;var depart:boolean);
var  event : TSDL_Event;
	key : TSDL_KeyboardEvent;
	
	
begin

while not depart do 
  begin
 SDL_PollEvent ( @event );
if event . type_ = SDL_KEYDOWN then
key:=event.key;
case key . keysym . sym of

	SDLK_LEFT : begin
		depart:=true;
	end;
	
		SDLK_RIGHT : begin
			depart:=true;
		end;
	end;
	
while (balle.Xdirection = 0) and (balle.Ydirection = 0) do
begin
balle.XDirection:=-10+random(20) ;
balle.YDirection:=-random(10); ;
end;
end;
end;

end.
