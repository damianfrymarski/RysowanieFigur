unit RysowanieFigur;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFormRysunek = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    memoCanvas: TMemo;
    btnDraw: TButton;
    cbChoiceShape: TComboBox;
    lblChoice: TLabel;
    lblGetSize: TLabel;
    edSize: TEdit;
    procedure btnDrawClick(Sender: TObject);
    procedure SetDefault;
  private
    { Private declarations }
    brush : Char;
    size : Integer;
    color : TColor;

  public
    { Public declarations }
  end;

var
  FormRysunek: TFormRysunek;

implementation
uses Figura;

{$R *.dfm}

procedure TFormRysunek.btnDrawClick(Sender: TObject);
var
_shape : IShape;
_ShapeFactory : TShapeFactory;
_ShapeArguments : TShapeArguments;
begin
   SetDefault;

   _ShapeArguments.size   := size;
   _ShapeArguments.brush  := brush;
   _ShapeArguments.color  := color;
   _ShapeArguments.memo   := memoCanvas;


   try
    _ShapeFactory := TShapeFactory.Create;
    _shape := _ShapeFactory.CreateShape(TShapes(cbChoiceShape.ItemIndex));
    _shape.SetArguments(_shapeArguments);
    _shape.Draw;

   finally
    _ShapeFactory.Free;
   end;

end;

procedure TFormRysunek.SetDefault;
begin
  brush := '*';
  size := StrToInt(edSize.Text);
  color := clRed;
  memoCanvas.Lines.Clear;

end;

end.
