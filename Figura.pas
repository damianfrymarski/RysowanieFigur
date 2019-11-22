unit Figura;

interface

uses Vcl.StdCtrls;


type
TShape = class
private
s : Integer;
znak : char;


public
  Constructor Create;
  Destructor Destroy;
  procedure Draw(memo : TMemo); virtual;
  procedure SetSize(s : Integer);
end;

type
TShapeA = class(TShape)
  procedure Draw(memo : TMemo); override;
end;

TShapeB = class(TShape)
  procedure Draw(memo : TMemo); override;
end;

TShapeC = class(TShape)
  procedure Draw(memo : TMemo); override;
end;

implementation

{ TShapeC }

procedure TShapeC.Draw(memo : TMemo);
var
  i,j : Integer;
  linia : String;
begin
  linia :='';
  for i := 0 to s do
  begin
      for j := s downto 0 do
      begin
        linia:=linia+znak;
      end;
      memo.Lines.Add(linia);
  end;

end;

{ TShape }

constructor TShape.Create;
begin
  inherited;
  s := 10;
  znak := '*';
end;

destructor TShape.Destroy;
begin
 inherited;
end;

procedure TShape.Draw(memo : TMemo);
begin

end;

procedure TShape.SetSize(s: Integer);
begin
  self.s := s;
end;

{ TShapeB }

procedure TShapeB.Draw(memo : TMemo);
var
  i,j : Integer;
  linia : string;
begin
   linia := '';
  for i:=0 to s do
  begin
    linia := linia + znak;
  end;
    memo.Lines.Add(linia);
    linia :='';

  for i:=0 to s-2 do
  begin
    linia:='';
    for j := 0 to s do
      begin
        if (j=0) or (j=s) then linia:=linia + znak
        else linia:=linia+'  ';
      end;
    memo.Lines.Add(linia);
  end;


  linia:='';
  for i:=0 to s do
  begin
    linia := linia + znak;
  end;
    memo.Lines.Add(linia);

end;

{ TShapeA }

procedure TShapeA.Draw(memo : TMemo);
  var
  i,j : Integer;
  linia : string;
begin
  linia := '';

  for i := 0 to s do
  begin
    linia :='';
    for j:=0 to s do
    begin
      linia := linia + znak;
    end;

    memo.Lines.Add(linia);
  end;


end;

end.
