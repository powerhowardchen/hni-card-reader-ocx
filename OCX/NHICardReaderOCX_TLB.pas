unit NHICardReaderOCX_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 2009-01-05 03:39:26 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\HowardData\Library\SampleAndTest\PCSC_HCard_Sample\NHICardReaderOCX.tlb (1)
// LIBID: {031D78C0-8E23-4830-A4AD-E9C54666756B}
// LCID: 0
// Helpfile: 
// HelpString: NHICardReaderOCX Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\system32\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  NHICardReaderOCXMajorVersion = 1;
  NHICardReaderOCXMinorVersion = 0;

  LIBID_NHICardReaderOCX: TGUID = '{031D78C0-8E23-4830-A4AD-E9C54666756B}';

  IID_INHICardReader: TGUID = '{B80531F1-C086-4C06-A316-87392F14AE6D}';
  DIID_INHICardReaderEvents: TGUID = '{55FAE3BC-0412-4CF1-BFF6-BDF4B54D2C14}';
  CLASS_NHICardReader: TGUID = '{1BFA1079-2761-4FF6-8499-5D886F7D972E}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum TxActiveFormBorderStyle
type
  TxActiveFormBorderStyle = TOleEnum;
const
  afbNone = $00000000;
  afbSingle = $00000001;
  afbSunken = $00000002;
  afbRaised = $00000003;

// Constants for enum TxPrintScale
type
  TxPrintScale = TOleEnum;
const
  poNone = $00000000;
  poProportional = $00000001;
  poPrintToFit = $00000002;

// Constants for enum TxMouseButton
type
  TxMouseButton = TOleEnum;
const
  mbLeft = $00000000;
  mbRight = $00000001;
  mbMiddle = $00000002;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  INHICardReader = interface;
  INHICardReaderDisp = dispinterface;
  INHICardReaderEvents = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  NHICardReader = INHICardReader;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PPUserType1 = ^IFontDisp; {*}


// *********************************************************************//
// Interface: INHICardReader
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B80531F1-C086-4C06-A316-87392F14AE6D}
// *********************************************************************//
  INHICardReader = interface(IDispatch)
    ['{B80531F1-C086-4C06-A316-87392F14AE6D}']
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_AutoScroll: WordBool; safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    function Get_AutoSize: WordBool; safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure _Set_Font(var Value: IFontDisp); safecall;
    function Get_KeyPreview: WordBool; safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    function Get_PixelsPerInch: Integer; safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    function Get_Scaled: WordBool; safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    function Get_Active: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    function Get_HelpFile: WideString; safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    function Get_ScreenSnap: WordBool; safecall;
    procedure Set_ScreenSnap(Value: WordBool); safecall;
    function Get_SnapBuffer: Integer; safecall;
    procedure Set_SnapBuffer(Value: Integer); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    function Get_AlignDisabled: WordBool; safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_APIReady: WordBool; safecall;
    function Get_ReaderCount: Integer; safecall;
    function Get_ReaderIndex: Integer; safecall;
    procedure Set_ReaderIndex(Value: Integer); safecall;
    function Get_ReaderName: WideString; safecall;
    function Get_CardPresent: WordBool; safecall;
    function Read: WordBool; safecall;
    function Get_ErrorMsg: WideString; safecall;
    function Get_NHI_CardNo: WideString; safecall;
    function Get_NHI_HolderName: WideString; safecall;
    function Get_NHI_IDNO: WideString; safecall;
    function Get_NHI_BirthDate: TDateTime; safecall;
    function Get_NHI_Sex: WideString; safecall;
    function Get_NHI_IssueDate: TDateTime; safecall;
    procedure Refresh; safecall;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property AutoScroll: WordBool read Get_AutoScroll write Set_AutoScroll;
    property AutoSize: WordBool read Get_AutoSize write Set_AutoSize;
    property AxBorderStyle: TxActiveFormBorderStyle read Get_AxBorderStyle write Set_AxBorderStyle;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property Font: IFontDisp read Get_Font write Set_Font;
    property KeyPreview: WordBool read Get_KeyPreview write Set_KeyPreview;
    property PixelsPerInch: Integer read Get_PixelsPerInch write Set_PixelsPerInch;
    property PrintScale: TxPrintScale read Get_PrintScale write Set_PrintScale;
    property Scaled: WordBool read Get_Scaled write Set_Scaled;
    property Active: WordBool read Get_Active;
    property DropTarget: WordBool read Get_DropTarget write Set_DropTarget;
    property HelpFile: WideString read Get_HelpFile write Set_HelpFile;
    property ScreenSnap: WordBool read Get_ScreenSnap write Set_ScreenSnap;
    property SnapBuffer: Integer read Get_SnapBuffer write Set_SnapBuffer;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property AlignDisabled: WordBool read Get_AlignDisabled;
    property VisibleDockClientCount: Integer read Get_VisibleDockClientCount;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property APIReady: WordBool read Get_APIReady;
    property ReaderCount: Integer read Get_ReaderCount;
    property ReaderIndex: Integer read Get_ReaderIndex write Set_ReaderIndex;
    property ReaderName: WideString read Get_ReaderName;
    property CardPresent: WordBool read Get_CardPresent;
    property ErrorMsg: WideString read Get_ErrorMsg;
    property NHI_CardNo: WideString read Get_NHI_CardNo;
    property NHI_HolderName: WideString read Get_NHI_HolderName;
    property NHI_IDNO: WideString read Get_NHI_IDNO;
    property NHI_BirthDate: TDateTime read Get_NHI_BirthDate;
    property NHI_Sex: WideString read Get_NHI_Sex;
    property NHI_IssueDate: TDateTime read Get_NHI_IssueDate;
  end;

// *********************************************************************//
// DispIntf:  INHICardReaderDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B80531F1-C086-4C06-A316-87392F14AE6D}
// *********************************************************************//
  INHICardReaderDisp = dispinterface
    ['{B80531F1-C086-4C06-A316-87392F14AE6D}']
    property Visible: WordBool dispid 201;
    property AutoScroll: WordBool dispid 202;
    property AutoSize: WordBool dispid 203;
    property AxBorderStyle: TxActiveFormBorderStyle dispid 204;
    property Caption: WideString dispid -518;
    property Color: OLE_COLOR dispid -501;
    property Font: IFontDisp dispid -512;
    property KeyPreview: WordBool dispid 205;
    property PixelsPerInch: Integer dispid 206;
    property PrintScale: TxPrintScale dispid 207;
    property Scaled: WordBool dispid 208;
    property Active: WordBool readonly dispid 209;
    property DropTarget: WordBool dispid 210;
    property HelpFile: WideString dispid 211;
    property ScreenSnap: WordBool dispid 212;
    property SnapBuffer: Integer dispid 213;
    property DoubleBuffered: WordBool dispid 214;
    property AlignDisabled: WordBool readonly dispid 215;
    property VisibleDockClientCount: Integer readonly dispid 216;
    property Enabled: WordBool dispid -514;
    property APIReady: WordBool readonly dispid 217;
    property ReaderCount: Integer readonly dispid 218;
    property ReaderIndex: Integer dispid 219;
    property ReaderName: WideString readonly dispid 220;
    property CardPresent: WordBool readonly dispid 221;
    function Read: WordBool; dispid 222;
    property ErrorMsg: WideString readonly dispid 223;
    property NHI_CardNo: WideString readonly dispid 224;
    property NHI_HolderName: WideString readonly dispid 225;
    property NHI_IDNO: WideString readonly dispid 226;
    property NHI_BirthDate: TDateTime readonly dispid 227;
    property NHI_Sex: WideString readonly dispid 228;
    property NHI_IssueDate: TDateTime readonly dispid 229;
    procedure Refresh; dispid 230;
  end;

// *********************************************************************//
// DispIntf:  INHICardReaderEvents
// Flags:     (4096) Dispatchable
// GUID:      {55FAE3BC-0412-4CF1-BFF6-BDF4B54D2C14}
// *********************************************************************//
  INHICardReaderEvents = dispinterface
    ['{55FAE3BC-0412-4CF1-BFF6-BDF4B54D2C14}']
    procedure OnActivate; dispid 201;
    procedure OnClick; dispid 202;
    procedure OnCreate; dispid 203;
    procedure OnDblClick; dispid 204;
    procedure OnDestroy; dispid 205;
    procedure OnDeactivate; dispid 206;
    procedure OnKeyPress(var Key: Smallint); dispid 207;
    procedure OnPaint; dispid 208;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TNHICardReader
// Help String      : NHICardReader Control
// Default Interface: INHICardReader
// Def. Intf. DISP? : No
// Event   Interface: INHICardReaderEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TNHICardReaderOnKeyPress = procedure(ASender: TObject; var Key: Smallint) of object;

  TNHICardReader = class(TOleControl)
  private
    FOnActivate: TNotifyEvent;
    FOnClick: TNotifyEvent;
    FOnCreate: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FOnDestroy: TNotifyEvent;
    FOnDeactivate: TNotifyEvent;
    FOnKeyPress: TNHICardReaderOnKeyPress;
    FOnPaint: TNotifyEvent;
    FIntf: INHICardReader;
    function  GetControlInterface: INHICardReader;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    function Read: WordBool;
    procedure Refresh;
    property  ControlInterface: INHICardReader read GetControlInterface;
    property  DefaultInterface: INHICardReader read GetControlInterface;
    property Visible: WordBool index 201 read GetWordBoolProp write SetWordBoolProp;
    property Active: WordBool index 209 read GetWordBoolProp;
    property DropTarget: WordBool index 210 read GetWordBoolProp write SetWordBoolProp;
    property HelpFile: WideString index 211 read GetWideStringProp write SetWideStringProp;
    property ScreenSnap: WordBool index 212 read GetWordBoolProp write SetWordBoolProp;
    property SnapBuffer: Integer index 213 read GetIntegerProp write SetIntegerProp;
    property DoubleBuffered: WordBool index 214 read GetWordBoolProp write SetWordBoolProp;
    property AlignDisabled: WordBool index 215 read GetWordBoolProp;
    property VisibleDockClientCount: Integer index 216 read GetIntegerProp;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp;
    property APIReady: WordBool index 217 read GetWordBoolProp;
    property ReaderCount: Integer index 218 read GetIntegerProp;
    property ReaderName: WideString index 220 read GetWideStringProp;
    property CardPresent: WordBool index 221 read GetWordBoolProp;
    property ErrorMsg: WideString index 223 read GetWideStringProp;
    property NHI_CardNo: WideString index 224 read GetWideStringProp;
    property NHI_HolderName: WideString index 225 read GetWideStringProp;
    property NHI_IDNO: WideString index 226 read GetWideStringProp;
    property NHI_BirthDate: TDateTime index 227 read GetTDateTimeProp;
    property NHI_Sex: WideString index 228 read GetWideStringProp;
    property NHI_IssueDate: TDateTime index 229 read GetTDateTimeProp;
  published
    property Anchors;
    property  ParentColor;
    property  ParentFont;
    property  Align;
    property  DragCursor;
    property  DragMode;
    property  ParentShowHint;
    property  PopupMenu;
    property  ShowHint;
    property  TabOrder;
    property  OnDragDrop;
    property  OnDragOver;
    property  OnEndDrag;
    property  OnEnter;
    property  OnExit;
    property  OnStartDrag;
    property AutoScroll: WordBool index 202 read GetWordBoolProp write SetWordBoolProp stored False;
    property AutoSize: WordBool index 203 read GetWordBoolProp write SetWordBoolProp stored False;
    property AxBorderStyle: TOleEnum index 204 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Caption: WideString index -518 read GetWideStringProp write SetWideStringProp stored False;
    property Color: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property KeyPreview: WordBool index 205 read GetWordBoolProp write SetWordBoolProp stored False;
    property PixelsPerInch: Integer index 206 read GetIntegerProp write SetIntegerProp stored False;
    property PrintScale: TOleEnum index 207 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Scaled: WordBool index 208 read GetWordBoolProp write SetWordBoolProp stored False;
    property ReaderIndex: Integer index 219 read GetIntegerProp write SetIntegerProp stored False;
    property OnActivate: TNotifyEvent read FOnActivate write FOnActivate;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnCreate: TNotifyEvent read FOnCreate write FOnCreate;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy;
    property OnDeactivate: TNotifyEvent read FOnDeactivate write FOnDeactivate;
    property OnKeyPress: TNHICardReaderOnKeyPress read FOnKeyPress write FOnKeyPress;
    property OnPaint: TNotifyEvent read FOnPaint write FOnPaint;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'Servers';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

procedure TNHICardReader.InitControlData;
const
  CEventDispIDs: array [0..7] of DWORD = (
    $000000C9, $000000CA, $000000CB, $000000CC, $000000CD, $000000CE,
    $000000CF, $000000D0);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData2 = (
    ClassID: '{1BFA1079-2761-4FF6-8499-5D886F7D972E}';
    EventIID: '{55FAE3BC-0412-4CF1-BFF6-BDF4B54D2C14}';
    EventCount: 8;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil (*HR:$00000000*);
    Flags: $0000001D;
    Version: 401;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := Cardinal(@@FOnActivate) - Cardinal(Self);
end;

procedure TNHICardReader.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as INHICardReader;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TNHICardReader.GetControlInterface: INHICardReader;
begin
  CreateControl;
  Result := FIntf;
end;

function TNHICardReader.Read: WordBool;
begin
  Result := DefaultInterface.Read;
end;

procedure TNHICardReader.Refresh;
begin
  DefaultInterface.Refresh;
end;

procedure Register;
begin
  RegisterComponents(dtlOcxPage, [TNHICardReader]);
end;

end.
