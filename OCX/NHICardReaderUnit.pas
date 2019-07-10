unit NHICardReaderUnit;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, NHICardReaderOCX_TLB, StdVcl, ExtCtrls, PCSCConnector,
  StdCtrls;

type
  TNHICardReader = class(TActiveForm, INHICardReader)
    pcscconMain: TPCSCConnector;
    Panel1: TPanel;
  private
    { Private declarations }
    FEvents: INHICardReaderEvents;
    FErrorMsg: string;
    procedure ClearCurHCardRecord;
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure PaintEvent(Sender: TObject);
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function Get_Active: WordBool; safecall;
    function Get_AlignDisabled: WordBool; safecall;
    function Get_AutoScroll: WordBool; safecall;
    function Get_AutoSize: WordBool; safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    function Get_Caption: WideString; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_HelpFile: WideString; safecall;
    function Get_KeyPreview: WordBool; safecall;
    function Get_PixelsPerInch: Integer; safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    function Get_Scaled: WordBool; safecall;
    function Get_ScreenSnap: WordBool; safecall;
    function Get_SnapBuffer: Integer; safecall;
    function Get_Visible: WordBool; safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    procedure _Set_Font(var Value: IFontDisp); safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    procedure Set_ScreenSnap(Value: WordBool); safecall;
    procedure Set_SnapBuffer(Value: Integer); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_APIReady: WordBool; safecall;
    function Get_CardPresent: WordBool; safecall;
    function Get_ErrorMsg: WideString; safecall;
    function Get_NHI_BirthDate: TDateTime; safecall;
    function Get_NHI_CardNo: WideString; safecall;
    function Get_NHI_HolderName: WideString; safecall;
    function Get_NHI_IDNO: WideString; safecall;
    function Get_NHI_IssueDate: TDateTime; safecall;
    function Get_NHI_Sex: WideString; safecall;
    function Get_ReaderCount: Integer; safecall;
    function Get_ReaderIndex: Integer; safecall;
    function Get_ReaderName: WideString; safecall;
    function Read: WordBool; safecall;
    procedure Set_ReaderIndex(Value: Integer); safecall;
    procedure Refresh; safecall;
  public
    { Public declarations }
    procedure Initialize; override;
  end;

implementation

uses ComObj, ComServ;

{$R *.DFM}

{ TNHICardReader }

procedure TNHICardReader.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_NHICardReaderPage); }
end;

procedure TNHICardReader.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as INHICardReaderEvents;
  inherited EventSinkChanged(EventSink);
end;

procedure TNHICardReader.Initialize;
begin
  inherited Initialize;
  OnActivate := ActivateEvent;
  OnClick := ClickEvent;
  OnCreate := CreateEvent;
  OnDblClick := DblClickEvent;
  OnDeactivate := DeactivateEvent;
  OnDestroy := DestroyEvent;
  OnKeyPress := KeyPressEvent;
  OnPaint := PaintEvent;

  ClearCurHCardRecord;

  if not pcscconMain.APIReady then
    FErrorMsg := 'API Not Ready'
  else
    FErrorMsg := '';
end;

function TNHICardReader.Get_Active: WordBool;
begin
  Result := Active;
end;

function TNHICardReader.Get_AlignDisabled: WordBool;
begin
  Result := AlignDisabled;
end;

function TNHICardReader.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TNHICardReader.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TNHICardReader.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TNHICardReader.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TNHICardReader.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TNHICardReader.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TNHICardReader.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TNHICardReader.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TNHICardReader.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TNHICardReader.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TNHICardReader.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TNHICardReader.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TNHICardReader.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TNHICardReader.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TNHICardReader.Get_ScreenSnap: WordBool;
begin
  Result := ScreenSnap;
end;

function TNHICardReader.Get_SnapBuffer: Integer;
begin
  Result := SnapBuffer;
end;

function TNHICardReader.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TNHICardReader.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TNHICardReader._Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TNHICardReader.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TNHICardReader.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TNHICardReader.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TNHICardReader.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TNHICardReader.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TNHICardReader.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TNHICardReader.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TNHICardReader.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TNHICardReader.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TNHICardReader.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TNHICardReader.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TNHICardReader.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TNHICardReader.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TNHICardReader.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TNHICardReader.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TNHICardReader.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TNHICardReader.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TNHICardReader.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TNHICardReader.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TNHICardReader.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TNHICardReader.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TNHICardReader.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TNHICardReader.Set_ScreenSnap(Value: WordBool);
begin
  ScreenSnap := Value;
end;

procedure TNHICardReader.Set_SnapBuffer(Value: Integer);
begin
  SnapBuffer := Value;
end;

procedure TNHICardReader.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

type
  THCardRecord = record
    CardNo: string;
    HolderName: string;
    IDNO: string;
    BirthDate: TDateTime;
    Sex: string;
    IssueDate: TDateTime;
  end;

var
  CurHCardRecord: THCardRecord;

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

function TNHICardReader.Get_APIReady: WordBool;
begin
  Result := pcscconMain.APIReady;
end;

function TNHICardReader.Get_CardPresent: WordBool;
begin
  Result := pcscconMain.CardPresent;
end;

function TNHICardReader.Get_ErrorMsg: WideString;
begin
  Result := FErrorMsg;
end;

function TNHICardReader.Get_NHI_BirthDate: TDateTime;
begin
  Result := CurHCardRecord.BirthDate;
end;

function TNHICardReader.Get_NHI_CardNo: WideString;
begin
  Result := CurHCardRecord.CardNo;
end;

function TNHICardReader.Get_NHI_HolderName: WideString;
begin
  Result := CurHCardRecord.HolderName;
end;

function TNHICardReader.Get_NHI_IDNO: WideString;
begin
  Result := CurHCardRecord.IDNO;
end;

function TNHICardReader.Get_NHI_IssueDate: TDateTime;
begin
  Result := CurHCardRecord.IssueDate;
end;

function TNHICardReader.Get_NHI_Sex: WideString;
begin
  Result := CurHCardRecord.Sex;
end;

function TNHICardReader.Get_ReaderCount: Integer;
begin
  Result := pcscconMain.ReaderList.Count;
end;

function TNHICardReader.Get_ReaderIndex: Integer;
begin
  Result := pcscconMain.ReaderIndex;
end;

function TNHICardReader.Get_ReaderName: WideString;
begin
  if (pcscconMain.ReaderIndex >= 0) and (pcscconMain.ReaderIndex < pcscconMain.ReaderList.Count) then
    Result := pcscconMain.ReaderList[pcscconMain.ReaderIndex]
  else
    Result := '';
end;

function TNHICardReader.Read: WordBool;
const
  SelectAPDU: string = '00 A4 04 00 10 D1 58 00 00 01 00 00 00 00 00 00 00 00 00 11 00';
  ReadProfileAPDU: string = '00 CA 11 00 02 00 00';
var
  Ret: string;
begin
  ClearCurHCardRecord;

  FErrorMsg := '';
  Result := False;

  if (pcscconMain.ReaderIndex < 0) or (pcscconMain.ReaderIndex >= pcscconMain.ReaderList.Count) then
  begin
    FErrorMsg := 'Reader Index Incorrect';
    Exit;
  end;

  pcscconMain.Connect;

  if pcscconMain.Connected then
  begin
    try
      Ret := pcscconMain.GetResponseFromCard(SelectAPDU);

      if Ret <> '90 00' then
      begin
        FErrorMsg := 'Is Not NHI Card';
        Exit;
      end;

      Ret := pcscconMain.GetResponseFromCard(ReadProfileAPDU);

      CurHCardRecord := GetHCardRecord(Hex2Bytes(Ret));

      Result := True;
    finally
      pcscconMain.Disconnect;
    end;
  end
  else
    FErrorMsg := 'Card Connect Fail';
end;

procedure TNHICardReader.Set_ReaderIndex(Value: Integer);
begin
  if (Value >= 0) and (Value < pcscconMain.ReaderList.Count) then
    pcscconMain.ReaderIndex := Value
  else
    pcscconMain.ReaderIndex := -1;
    
  ClearCurHCardRecord;
end;

procedure TNHICardReader.Refresh;
begin
  pcscconMain.Refresh;
  
  ClearCurHCardRecord;
end;

procedure TNHICardReader.ClearCurHCardRecord;
begin
  CurHCardRecord.CardNo := '';
  CurHCardRecord.HolderName := '';
  CurHCardRecord.IDNO := '';
  CurHCardRecord.BirthDate := 0;
  CurHCardRecord.Sex := '';
  CurHCardRecord.IssueDate := 0;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TNHICardReader,
    Class_NHICardReader,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.
