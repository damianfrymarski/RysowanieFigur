unit Figura;

interface

uses Vcl.StdCtrls, Vcl.Graphics;

type
TShapes = (fullSquare, frameSquare, triangle, diamond);

type
IShape = interface ['{DF2A928C-EB97-4431-8056-E772D660D356}']
procedure Draw;
procedure SetSize(sizeFigure : Integer);
procedure SetColor(color : TColor);
procedure SetCanvas(memo : TMemo);
end;

type
TShape = class(TInterfacedObject, IShape)
private
sizeFigure : Integer;
brush : char;
space : char;
memo  : TMemo;
function DrawLine(size : Integer; brush : char) : String;

public
  Constructor Create;
  Destructor Destroy;
  procedure Draw; virtual;
  procedure SetSize(sizeFigure : Integer);
  procedure SetBrush(brush : char);
  procedure SetColor(color : TColor);
  procedure SetCanvas(memo : Tmemo);
end;

type
TShapeFullSquare = class(TShape)
  procedure Draw; override;
end;

TShapeFrameSquare = class(TShape)
  procedure Draw; override;
end;

TShapeTriangle = class(TShape)
  procedure Draw; override;
end;

TShapeDiamond = class(TShape)
  procedure Draw; override;
end;

type
TShapeFactory = class
  function CreateShape(shape : TShapes) : IShape;
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

procedure TShape.Draw;
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

procedure TShape.SetBrush(brush: char);
begin
  self.brush := brush;
end;

procedure TShape.SetCanvas(memo: Tmemo);
begin
  self.memo := memo;
end;

procedure TShape.SetColor(color: TColor);
begin
  memo.Font.Color := color;
end;

{ TShapeFullSquare }

procedure TShapeFullSquare.Draw;
  var
  i : Integer;
begin
  for i := 0 to sizeFigure do
  begin
    memo.Lines.Add(DrawLine(sizeFigure,brush));
  end;
end;

{ TShapeB }

procedure TShapeFrameSquare.Draw;
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

{ TShapeTriangle }

procedure TShapeTriangle.Draw;
var
  i : Integer;
begin
  for i := 0 to sizeFigure do
  begin
    memo.Lines.Add(DrawLine(sizeFigure-i,brush));
  end;

end;

{ TShapeDiamond }

procedure TShapeDiamond.Draw;
var
  i : Integer;
begin
  for i := 0 to sizeFigure do
  begin
    memo.Lines.Add(DrawLine(sizeFigure-i,brush)+DrawLine(i*4,space)+DrawLine(sizeFigure-i, brush) );
  end;

  for i := sizeFigure downto 0 do
  begin
    memo.Lines.Add(DrawLine(sizeFigure-i,brush)+DrawLine(i*4,space)+DrawLine(sizeFigure-i, brush));
  end;

end;

{ TShapeFactory }

function TShapeFactory.CreateShape(shape: TShapes): IShape;
begin
  case shape of
    TShapes.fullSquare  :  result := TShapeFullSquare.Create;
    TShapes.frameSquare :  result := TShapeFrameSquare.Create;
    TShapes.triangle    :  result := TShapeTriangle.Create;
    TShapes.diamond     :  result := TShapeDiamond.Create;
  end;
end;

end.
