unit SampleMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, PCSCConnector, StdCtrls;

type
  TForm1 = class(TForm)
    PCSCConnector: TPCSCConnector;
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure PCSCConnectorError(Sender: TObject; ProcSource: TProcSource;
      ErrCode: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

type
  THCardRecord = record
    CardNo: string;
    HolderName: string;
    IDNO: string;
    BirthDate: TDateTime;
    Sex: string;
    IssueDate: TDateTime;
  end;

function GetHCardRecord(Value: TBytes): THCardRecord;
var
  Data: AnsiString;
begin
  Data := Bytes2AnsiString(Value);
  Result.CardNo := Copy(Data, 1, 12);
  Result.HolderName := Copy(Data, 13, 6);
  Result.IDNO := Copy(Data, 33, 10);
  Result.BirthDate := EncodeDate(StrToIntDef(Copy(Data, 43, 3), 1) + 1911, StrToIntDef(Copy(Data, 46, 2), 1), StrToIntDef(Copy(Data, 48, 2), 1));
  Result.Sex := Copy(Data, 50, 1);
  Result.IssueDate := EncodeDate(StrToIntDef(Copy(Data, 51, 3), 1) + 1911, StrToIntDef(Copy(Data, 54, 2), 1), StrToIntDef(Copy(Data, 56, 2), 1));
end;

procedure TForm1.Button1Click(Sender: TObject);
const
  BoolStr: array [Boolean] of string = ('False', 'True');
  SelectAPDU: string = '00 A4 04 00 10 D1 58 00 00 01 00 00 00 00 00 00 00 00 00 11 00';
  ReadProfileAPDU: string = '00 CA 11 00 02 00 00';
begin
  PCSCConnector.Refresh;

  Memo1.Lines.Clear;

  if PCSCConnector.APIReady then
    Memo1.Lines.Add('API Ready.');

  Memo1.Lines.Add('Card Reader List:');
  Memo1.Lines.AddStrings(PCSCConnector.ReaderList);

  if PCSCConnector.ReaderList.Count > 0 then
  begin
    PCSCConnector.ReaderIndex := 0;

    Memo1.Lines.Add('CardPresent: ' + BoolStr[PCSCConnector.CardPresent]);
    Memo1.Lines.Add('CardMute: ' + BoolStr[PCSCConnector.CardMute]);
    Memo1.Lines.Add('ReaderPadding: ' + BoolStr[PCSCConnector.ReaderPadding]);

    PCSCConnector.Connect;

    if PCSCConnector.Connected then
    begin
      Memo1.Lines.Add('Card Reader Connected.');
      Memo1.Lines.Add('Select APDU: ' + Bytes2Hex(PCSCConnector.GetResponseFromCard(Hex2Bytes(SelectAPDU))));

      with GetHCardRecord(PCSCConnector.GetResponseFromCard(Hex2Bytes(ReadProfileAPDU))) do
      begin
        Memo1.Lines.Add('Card NO: ' + CardNo);
        Memo1.Lines.Add('Name: ' + HolderName);
        Memo1.Lines.Add('IDN: ' + IDNO);
        Memo1.Lines.Add('Birth Date: ' + FormatDateTime('YYYY/MM/DD', BirthDate));
        Memo1.Lines.Add('Sex: ' + Sex);
        Memo1.Lines.Add('Issue Date: ' + FormatDateTime('YYYY/MM/DD', IssueDate));
      end;

      PCSCConnector.Disconnect;
    end
    else
      Memo1.Lines.Add('Card Reader Connect Fail.');
  end;
end;

procedure TForm1.PCSCConnectorError(Sender: TObject;
  ProcSource: TProcSource; ErrCode: Integer);
begin
  Memo1.Lines.Add('Error: ' + IntToStr(ErrCode));
end;

end.
