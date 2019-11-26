unit RysowanieFigur;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFormRysunek = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    memoRysunek: TMemo;
    btnRysuj: TButton;
    cbWyborFigur: TComboBox;
    lblWybor: TLabel;
    lblPodajRozmiar: TLabel;
    edRozmiarFigury: TEdit;
    procedure btnRysujClick(Sender: TObject);
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

procedure TFormRysunek.btnRysujClick(Sender: TObject);
var _fig : IShape;
begin
  znak := '*';
  rozmiar := StrToInt(edRozmiarFigury.Text);
  memoRysunek.Lines.Clear;
  try
    case cbWyborFigur.ItemIndex of
    0 :   _fig := TShapeA.Create;
    1 :   _fig := TShapeB.Create;
    2 :   _fig := TShapeC.Create;
  end;
   _fig.SetSize(rozmiar);
   _fig.Draw(memoRysunek);

  finally

  end;





end;

end.
