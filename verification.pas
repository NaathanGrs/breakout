unit verification;

interface

uses sdl2,sdl2_image, BreakOut_Type;
procedure verif_fin(vie : integer; case_ou_non : niveau;var quit :boolean);

implementation
procedure verif_fin(vie : integer; case_ou_non : niveau;var quit :boolean);
var i,j : integer;
	var tab_vide :boolean;
begin 
tab_vide:=true;
for j:=1 to 3 do
for  i:=1 to 11 do
if case_ou_non[i][j] <> 0 then 
tab_vide:=false;

if (vie = 0) or tab_vide then
quit:=true;
end;
end.
