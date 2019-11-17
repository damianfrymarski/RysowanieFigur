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
    procedure RysujFigureA;
    procedure RysujFigureB;
    procedure RysujFigureC;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  znak := '*';
  rozmiar := StrToInt(Edit1.Text);
  memo1.Lines.Clear;
  if ComboBox1.ItemIndex=0 then RysujFigureA
  else if ComboBox1.ItemIndex=1 then RysujFigureB
  else if ComboBox1.ItemIndex=2 then RysujFigureC;


end;

procedure TForm1.RysujFigureA;
var
  i,j : Integer;
  linia : string;
begin
  linia := '';

  for i := 0 to rozmiar do
  begin
    linia :='';
    for j:=0 to rozmiar do
    begin
      linia := linia + znak;
    end;

    memo1.Lines.Add(linia);
  end;



end;

procedure TForm1.RysujFigureB;
var
  i,j : Integer;
  linia : string;
begin
   linia := '';
  for i:=0 to rozmiar do
  begin
    linia := linia + znak;
  end;
    memo1.Lines.Add(linia);
    linia :='';

  for i:=0 to rozmiar-2 do
  begin
    linia:='';
    for j := 0 to rozmiar do
      begin
        if (j=0) or (j=rozmiar) then linia:=linia + znak
        else linia:=linia+'  ';
      end;
    memo1.Lines.Add(linia);
  end;


  linia:='';
  for i:=0 to rozmiar do
  begin
    linia := linia + znak;
  end;
    memo1.Lines.Add(linia);

end;

procedure TForm1.RysujFigureC;
begin

end;

end.
