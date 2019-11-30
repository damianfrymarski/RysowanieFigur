unit Figura;

interface

uses Vcl.StdCtrls, Vcl.Graphics;

type
TShapes = (fullSquare, frameSquare, triangle, diamond);

type
TShapeArguments = record
size : integer;
brush : char;
color : TColor;
memo : TMemo;
end;

type
IShape = interface ['{DF2A928C-EB97-4431-8056-E772D660D356}']
procedure Draw;
procedure SetSize(sizeFigure : Integer);
procedure SetBrush(brush : char);
procedure SetColor(color : TColor);
procedure SetCanvas(memo : TMemo);
procedure SetArguments(Arguments : TShapeArguments);
end;

type
TShape = class abstract(TInterfacedObject, IShape)
private
sizeFigure : Integer;
brush : char;
space : char;
memo  : TMemo;
color : TColor;
function DrawLine(size : Integer; brush : char) : String;
procedure SetMemo;

public
  Constructor Create;
  Destructor Destroy;
  procedure Draw; virtual;
  procedure SetSize(sizeFigure : Integer);
  procedure SetBrush(brush : char);
  procedure SetColor(color : TColor);
  procedure SetCanvas(memo : Tmemo);
  procedure SetArguments(Arguments : TShapeArguments);
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
  for i:=0 to size-1 do
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
  self.color := color;
end;


procedure TShape.SetArguments(Arguments: TShapeArguments);
begin
  self.sizeFigure := Arguments.size;
  self.brush  := Arguments.brush;
  self.memo   := Arguments.memo;
  self.color  := Arguments.color;
  SetMemo;
end;

procedure TShape.SetMemo;
begin
  memo.Font.Color := self.color;
end;

{ TShapeFullSquare }

procedure TShapeFullSquare.Draw;
  var
  i : Integer;
begin
  for i := 0 to sizeFigure-1 do
  begin
    memo.Lines.Add(DrawLine(sizeFigure,brush));
  end;
end;

{ TShapeFrameSquare }

procedure TShapeFrameSquare.Draw;
var
  i : Integer;
  halfSize : integer;
begin
  halfSize := Round(sizeFigure / 2);
  memo.Lines.Add(DrawLine(sizeFigure, Self.brush));
  for i:=0 to sizeFigure-2 do
  begin
    memo.Lines.Add(DrawLine(1,self.brush)+DrawLine(sizeFigure+halfSize,self.space)+DrawLine(1,self.brush));
  end;
  memo.Lines.Add(DrawLine(sizeFigure, Self.brush));
end;

{ TShapeTriangle }

procedure TShapeTriangle.Draw;
var
  i : Integer;
begin
  for i := 0 to sizeFigure-1 do
  begin
    memo.Lines.Add(DrawLine(sizeFigure-i,self.brush));
  end;

end;

{ TShapeDiamond }

procedure TShapeDiamond.Draw;
var
  i : Integer;
begin
  for i := 0 to sizeFigure-1 do
  begin
    memo.Lines.Add(DrawLine(sizeFigure-i,self.brush)+DrawLine(i*4,self.space)+DrawLine(sizeFigure-i, self.brush) );
  end;

  for i := sizeFigure-1 downto 0 do
  begin
    memo.Lines.Add(DrawLine(sizeFigure-i,self.brush)+DrawLine(i*4,self.space)+DrawLine(sizeFigure-i, self.brush));
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
