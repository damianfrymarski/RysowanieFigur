unit Figura;

interface

uses Vcl.StdCtrls;


type
IShape = interface ['{DF2A928C-EB97-4431-8056-E772D660D356}']
procedure Draw(memo : TMemo);
procedure SetSize(sizeFigure : Integer);
end;

type
TShape = class(TInterfacedObject, IShape)
private
sizeFigure : Integer;
brush : char;
space : char;
function DrawLine(size : Integer; brush : char) : String;

public
  Constructor Create;
  Destructor Destroy;
  procedure Draw(memo : TMemo); virtual;
  procedure SetSize(sizeFigure : Integer);
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

{ TShape }

constructor TShape.Create;
begin
  inherited;
  sizeFigure := 10;
  brush := '*';
  space := ' ';
end;

destructor TShape.Destroy;
begin
 inherited;
end;

procedure TShape.Draw(memo : TMemo);
begin
  memo.Lines.Add('virtual')
end;

function TShape.DrawLine(size : Integer; brush : char) : String;
var
i : Integer;
begin
  result:='';
  for i:=0 to size do
  begin
    result := result + brush;
  end;
end;


procedure TShape.SetSize(sizeFigure: Integer);
begin
  self.sizeFigure := sizeFigure;
end;


{ TShapeA }

procedure TShapeA.Draw(memo : TMemo);
  var
  i : Integer;
begin
  for i := 0 to sizeFigure do
  begin
    memo.Lines.Add(DrawLine(sizeFigure,brush));
  end;
end;

{ TShapeB }

procedure TShapeB.Draw(memo : TMemo);
var
  i : Integer;
begin
  memo.Lines.Add(DrawLine(sizeFigure, Self.brush));
  for i:=0 to sizeFigure-2 do
  begin
    memo.Lines.Add(DrawLine(0,brush)+DrawLine(sizeFigure-2,space)+DrawLine(sizeFigure-4,space)+DrawLine(0,brush));
  end;
  memo.Lines.Add(DrawLine(sizeFigure, Self.brush));
end;

{ TShapeC }

procedure TShapeC.Draw(memo : TMemo);
var
  i : Integer;
begin
  for i := 0 to sizeFigure do
  begin
    memo.Lines.Add(DrawLine(sizeFigure-i,brush));
  end;

end;


end.
