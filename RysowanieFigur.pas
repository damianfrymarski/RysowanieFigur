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
    procedure UstawDomyslne;
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
   UstawDomyslne;
  try
    case cbWyborFigur.ItemIndex of
    0 :   _fig := TShapeA.Create;
    1 :   _fig := TShapeB.Create;
    2 :   _fig := TShapeC.Create;
    3 :   _fig := TShapeD.Create;
    end;
   _fig.SetSize(rozmiar);
   _fig.SetColor(memoRysunek,clRed);
   _fig.Draw(memoRysunek);

  finally

  end;





end;

procedure TFormRysunek.UstawDomyslne;
begin
  znak := '*';
  rozmiar := StrToInt(edRozmiarFigury.Text);
  memoRysunek.Lines.Clear;
end;

end.
