unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btn_random: TButton;
    btn_bubblesort: TButton;
    btn_quicksort: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    procedure btn_bubblesortClick(Sender: TObject);
    procedure btn_quicksortClick(Sender: TObject);
    procedure btn_randomClick(Sender: TObject);
    procedure renderZahlen();
    procedure BubbleSort();
    procedure Quicksort(anfang, ende: integer);
  private

  public

  end;

var
  Form1: TForm1;
  zahlen: Array [0..5] of Integer;

implementation

{$R *.lfm}

{ TForm1 }

function RandomIntBetw(low: integer; high: integer): integer;
begin
  result:= Random(high - low) + low;
end;

procedure TForm1.renderZahlen();
begin
   Edit1.Text:= IntToStr(zahlen[0]);
   Edit2.Text:= IntToStr(zahlen[1]);
   Edit3.Text:= IntToStr(zahlen[2]);
   Edit4.Text:= IntToStr(zahlen[3]);
   Edit5.Text:= IntToStr(zahlen[4]);
   Edit6.Text:= IntToStr(zahlen[5]);
end;

procedure TForm1.btn_randomClick(Sender: TObject);
var zahlen_buffer: array of Integer;
    i: Integer;
    i2: Integer;
    rand: Integer;
begin
  SetLength(zahlen_buffer, High(zahlen)+1);
  for i:=Low(zahlen_buffer) to High(zahlen_buffer) do
  begin
     zahlen_buffer[i] := i;
  end;
  i2 := 0;
  for i:= High(zahlen_buffer) downto Low(zahlen_buffer) do
  begin
     rand:= RandomIntBetw(Low(zahlen_buffer), i);
     zahlen[i2] := zahlen_buffer[rand];
     delete(Zahlen_buffer, rand, 1);
     i2 += 1;
  end;
  renderZahlen();
end;

procedure TForm1.btn_bubblesortClick(Sender: TObject);
begin
  BubbleSort();
  renderZahlen();
end;

procedure TForm1.BubbleSort();
var i: integer;
    j: integer;
    buffer: Integer;
begin
   for i:= High(zahlen)-1 downto 0 do
   begin
       for j:=0 to i do
       begin
           if zahlen[j] > zahlen[j+1] then
           begin
             buffer := zahlen[j];
             zahlen[j] := zahlen[j+1];
             zahlen[j+1] := buffer;
           end;
       end;
   end;
end;

procedure TForm1.Quicksort(anfang, ende: integer);
var l,r,Mitte,Merke: integer;
begin
 l:=anfang;
 r:=ende;
 Mitte:= zahlen[(anfang+ende) div 2];
 repeat
   while zahlen[l]<Mitte do Inc(l);   //Gibt zurück den Index der Zahl Links die Größer als der Pivot ist

   while zahlen[r]>Mitte do Dec(r);    //Gibt zurück den Index der Zahl rechts die Kleiner als der Pivot ist

   if l <= r then
   begin
      Merke := zahlen[l];
      zahlen[l] := zahlen[r];
      zahlen[r] := Merke;
      Inc(l); //L ist jetzt eins größer als die Mitte
      Dec(r); //R ist jetzt eins kleiner als die Mitte
   end;
 until l>r;

 if anfang<r then Quicksort(anfang, r); //Sortiert demnach den array rechts vom Pivot
 if l<ende then Quicksort(l, ende);    //Sortiert demnach den array links vom Pivot
end;

procedure TForm1.btn_quicksortClick(Sender: TObject);
begin
 Quicksort(Low(zahlen), High(zahlen)-1);
 renderZahlen();
end;



end.

