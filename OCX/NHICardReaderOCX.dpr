library NHICardReaderOCX;

uses
  ComServ,
  NHICardReaderOCX_TLB in 'NHICardReaderOCX_TLB.pas',
  NHICardReaderUnit in 'NHICardReaderUnit.pas' {NHICardReader: TActiveForm} {NHICardReader: CoClass};

{$E ocx}

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
