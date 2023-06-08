unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }




procedure TForm1.Button1Click(Sender: TObject);
const
  MaxResult = 1.7e308;
  MinResult = -1.7e308;
var
  Principal, Rate, Time, Result: Double;
begin
  begin
    if (Edit1.Text = '') or (Edit2.Text = '') or (Edit3.Text = '') then ShowMessage('Введите числа')
    else
      begin
        try
          Principal := StrToFloat(Edit1.Text);
          Rate := StrToFloat(Edit2.Text);
          Time := StrToFloat(Edit3.Text);
          case ComboBox1.ItemIndex of
          0:
            begin
              Result := (Principal*(1+Time*(Rate/365)))*31;
              Edit4.Clear;
              if (Result <= MaxResult) and (Result >= MinResult) then
              Edit4.Text := Edit4.Text + FloatToStr(Result)
              else
                ShowMessage('overflow');
            end;
          1:
            begin
              Result := (Principal*(1+(Rate/100*Time)))*31;
              Edit4.Clear;
              if (Result <= MaxResult) and (Result >= MinResult) then
              Edit4.Text := Edit4.Text + FloatToStr(Result)
              else
                ShowMessage('overflow');
            end;
          end;
        except
          ShowMessage('error');
        end;
      end;
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

end.

