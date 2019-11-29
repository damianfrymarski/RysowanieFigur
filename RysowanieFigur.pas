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
    znak : Char;
    rozmiar : Integer;

  public
    { Public declarations }
  end;

var
  FormRysunek: TFormRysunek;

implementation
uses Figura;

{$R *.dfm}

procedure TFormRysunek.btnDrawClick(Sender: TObject);
var _shape : IShape;
var _ShapeFactory : TShapeFactory;
begin
   SetDefault;
   try
    _ShapeFactory := TShapeFactory.Create;

    _shape := _ShapeFactory.CreateShape(TShapes(cbChoiceShape.ItemIndex));
    _shape.SetCanvas(memoCanvas);
    _shape.SetSize(rozmiar);
    _shape.SetColor(clRed);
    _shape.Draw;

   finally
    _ShapeFactory.Free;
   end;







end;

procedure TFormRysunek.SetDefault;
begin
  znak := '*';
  rozmiar := StrToInt(edSize.Text);
  memoCanvas.Lines.Clear;
end;

end.
