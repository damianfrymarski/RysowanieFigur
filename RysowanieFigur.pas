unit RysowanieFigur;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Memo1: TMemo;
    Button1: TButton;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    znak : Char;
    rozmiar : Integer;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses Figura;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var _fig : TShape;
begin
  znak := '*';
  rozmiar := StrToInt(Edit1.Text);
  memo1.Lines.Clear;
  try
    case ComboBox1.ItemIndex of
    0 :   _fig := TShapeA.Create;
    1 :   _fig := TShapeB.Create;
    2 :   _fig := TShapeC.Create;
  end;
   _fig.SetSize(rozmiar);
   _fig.Draw(memo1);

  finally
    _fig.Free;
  end;





end;

end.
