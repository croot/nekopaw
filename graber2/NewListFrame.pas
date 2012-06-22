unit NewListFrame;

interface

uses
  {base}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls,
  {devexp}
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxCustomData, cxStyles, cxTL, cxTextEdit, cxCheckBox, cxTLdxBarBuiltInMenu,
  dxSkinsCore, ExtCtrls, cxSplitter, cxInplaceContainer,
  cxButtons, cxFilter, cxData, cxDataStorage, cxEdit,
  cxGridCustomTableView, cxGridTableView, cxGridCustomView, cxClasses,
  cxGridLevel, cxGrid, cxButtonEdit, cxExtEditRepositoryItems, cxPC, cxLabel,
  cxImage, cxEditRepositoryItems, cxVGrid,
  {graber2}
  common, Graberu;

type
  TListFrameState = (lfsNew, lfsEdit);

  TfNewList = class(TFrame)
    VSplitter: TcxSplitter;
    pButtons: TPanel;
    btnPrevious: TcxButton;
    lvlRes1: TcxGridLevel;
    gRes: TcxGrid;
    tvRes: TcxGridTableView;
    gRescName: TcxGridColumn;
    gRescButton: TcxGridColumn;
    pcMain: TcxPageControl;
    tsList: TcxTabSheet;
    tsSettings: TcxTabSheet;
    gFull: TcxGrid;
    tvFull: TcxGridTableView;
    tvFullcButton: TcxGridColumn;
    tvFullcName: TcxGridColumn;
    lvlFull1: TcxGridLevel;
    tvFullID: TcxGridColumn;
    tvFullcIcon: TcxGridColumn;
    gRescID: TcxGridColumn;
    tgRescIcon: TcxGridColumn;
    vgSettings: TcxVerticalGrid;
    btnNext: TcxButton;
    EditRepository: TcxEditRepository;
    erAuthButton: TcxEditRepositoryButtonItem;
    procedure gRescButtonGetProperties(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AProperties: TcxCustomEditProperties);
    procedure pcMainChange(Sender: TObject);
    procedure gRescButtonPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure tvFullcButtonPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure gRescNameGetProperties(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AProperties: TcxCustomEditProperties);
    procedure tvResFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure tsSettingsShow(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure erAuthButtonPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
    FOnError: TLogEvent;
  protected
    function ResetRelogin(idx: integer = -1): boolean;
    procedure SetIntrfEnabled(b: boolean);
    procedure LoginCallBack(Sender: TObject; N: integer; Login,Password: String;
    const Cancel: boolean);
  public
    State: TListFrameState;
    procedure AddItem(index: Integer);
    procedure RemoveItem(index: Integer);
    procedure CreateSettings(n: Integer);
    procedure SaveSettings;
    procedure LoadItems;
    procedure ResetItems;
    procedure SetLang;
    procedure OnErrorEvent(Sender: TObject; Msg: String);
    procedure JobStatus(Sander: TObject; Action: integer);
    property OnError: TLogEvent read FOnError write FOnError;
    { Public declarations }
  end;

implementation

uses OpBase, LangString, utils, LoginForm;

{$R *.dfm}

var
  LList: array of TcxLabelProperties;
  FLoggedOn: boolean;

function Min(n1, n2: Integer): Integer;
begin
  if n1 < n2 then
    Result := n1
  else
    Result := n2;
end;

function  TfNewList.ResetRelogin(idx: integer = -1): boolean;
var
  i: integer;
  n: TResource;
begin
  Result := false;
  for i := 0 to FullResList.Count -1 do
    FullResList[i].Relogin := false;
  if idx = -1 then
    for i := 1 to tvRes.DataController.RecordCount-1 do
    begin
      n := FullResList[tvRes.DataController.Values[i, 0]];
      if (n.HTTPRec.CookieStr<>'')and(n.LoginPrompt or (nullstr(n.Fields['login'])<>''))then
      begin
        n.Relogin := true;
        Result := true;
      end;
    end
  else
  begin
    n := FullResList[idx{tvRes.DataController.Values[idx, 0]}];
    if(n.HTTPRec.CookieStr<>'')and(n.LoginPrompt or (nullstr(n.Fields['login'])<>''))then
    begin
      n.Relogin := true;
      Result := true;
    end;
  end;
end;

procedure TfNewList.AddItem(index: Integer);
var
  i: Integer;
begin
  tvRes.BeginUpdate;
  tvFull.BeginUpdate;
  i := tvRes.DataController.RecordCount;
  tvRes.DataController.RecordCount := i + 1;
  tvRes.DataController.Values[i, 0] := tvFull.DataController.Values[index, 1];
  tvRes.DataController.Values[i, 1] := tvFull.DataController.Values[index, 2];
  tvRes.DataController.Values[i, 2] := tvFull.DataController.Values[index, 3];
  tvFull.DataController.DeleteRecord(index);
  tvRes.EndUpdate;
  tvFull.EndUpdate;

  btnNext.Enabled := tvRes.DataController.RowCount > 1;
end;

procedure TfNewList.btnNextClick(Sender: TObject);
begin
  if pcMain.ActivePage = tsSettings then
  begin
    FLoggedOn := true;
    if ResetRelogin then
      FullResList.StartJob(JOB_LOGIN)
    else
      case State of
        lfsNew:
          PostMessage(Application.MainForm.Handle, CM_APPLYNEWLIST, Integer(Parent), 0);
        lfsEdit:
          PostMessage(Application.MainForm.Handle, CM_APPLYEDITLIST, Integer(Parent), 0);
      end;
  end
  else
  begin
    tvRes.Controller.FocusedRowIndex := 0;
    pcMain.ActivePage := tsSettings;
    Application.MainForm.ActiveControl := vgSettings;
    vgSettings.RowByName('vgitag').Focused := true;
  end;
end;

procedure TfNewList.btnPreviousClick(Sender: TObject);
begin
  if pcMain.ActivePage = tsSettings then
    pcMain.ActivePage := tsList;
  if not FullResList.ListFinished then
    FullResList.StartJob(JOB_STOPLIST);
  FLoggedOn := false;
end;

procedure TfNewList.CreateSettings(n: Integer);
var
  c: TcxCategoryRow;
  //r: TcxEditorRow;
  i, d: Integer;
  s: string;

begin
  if vgSettings.Rows.Count > 0 then
    SaveSettings;
  vgSettings.BeginUpdate;
  vgSettings.ClearRows;
  vgSettings.Tag := n;
  if n = 0 then
  begin
    c := dm.CreateCategory(vgSettings,'vgimain',_MAINCONFIG_);
    dm.CreateField(vgSettings,'vgitag',_TAGSTRING_,'',ftString,c,FullResList[n].Fields['tag']);
    dm.CreateField(vgSettings,'vgidwpath',_SAVEPATH_,'',ftString,c,FullResList[n].NameFormat);
  end
  else
  with FullResList[n] do begin
    c := dm.CreateCategory(vgSettings,'vgimain',_MAINCONFIG_ + ' ' +
      FullResList[n].Name);
    dm.CreateField(vgSettings,'vgiinherit',_INHERIT_,'',ftCheck,c,Inherit);

    s := VarToStr(Fields['tag']);
    if (s = '') and Inherit then
      s := VarToStr(FullResList[0].Fields['tag']);
    dm.CreateField(vgSettings,'vgitag',_TAGSTRING_,'',ftString,c,s);

    s := NameFormat;
    if (s = '') and Inherit then
      s := FullResList[0].NameFormat;
    dm.CreateField(vgSettings,'vgidwpath',_SAVEPATH_,'',ftString,c,s);

    d := FullResList[0].Fields.Count;

    c := nil;

    if FullResList[n].Fields.Count > d then
    begin
      with FullResList[n].Fields do
        for i := d to Count - 1 do
          if Items[i].restype <> ftNone then
          begin
            if not Assigned(c) then
              c := dm.CreateCategory(vgSettings,'vgieditional',_EDITIONALCONFIG_);
            with FullResList[n].Fields.Items[i]^ do
              dm.CreateField(vgSettings,'evgi' + resname,resname,resitems,restype,c,resvalue);

               ///derp
          end;
    end;
  end;
  vgSettings.EndUpdate;
end;

procedure TfNewList.erAuthButtonPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  n: integer;
begin
  n := tvRes.DataController.Values[tvRes.DataController.FocusedRecordIndex,0];
  Application.CreateForm(TfLogin, fLogin);
  fLogin.Execute(n,
    Format(_LOGINON_,[FullResList[n].Name]),
    nullstr(FullResList[n].Fields['login']),
    nullstr(FullResList[n].Fields['password']),
    LoginCallback
    );
end;

procedure TfNewList.gRescButtonGetProperties(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AProperties: TcxCustomEditProperties);
begin
  if ARecord.Values[0] = 0 then
    AProperties := dm.erLabel.Properties;
end;

procedure TfNewList.gRescButtonPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  RemoveItem(tvRes.DataController.FocusedRecordIndex);
end;

procedure TfNewList.gRescNameGetProperties(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AProperties: TcxCustomEditProperties);
begin
  if (ARecord.Values[0] <> null) and (ARecord.Values[0] <> 0) then
    AProperties := erAuthButton.Properties;
  // ARecord.Values[2] := ARecord.Values[0];
end;

procedure TfNewList.OnErrorEvent(Sender: TObject; Msg: String);
begin
  if FLoggedOn then
    FLoggedOn := false;
  if Assigned(FOnError) then
    FOnError(Sender,Msg);
end;

procedure TfNewList.JobStatus(Sander: TObject; Action: integer);
begin
  if Action = JOB_STOPLIST then
  begin
    SetIntrfEnabled(true);
    if Assigned(fLogin) then
      if FLoggedOn then
        fLogin.Close
      else
        fLogin.bOk.Enabled := true
    else if FLoggedOn then
      case State of
        lfsNew:
          PostMessage(Application.MainForm.Handle, CM_APPLYNEWLIST, Integer(Parent), 0);
        lfsEdit:
          PostMessage(Application.MainForm.Handle, CM_APPLYEDITLIST, Integer(Parent), 0);
      end;
  end else
    SetIntrfEnabled(false);
end;

procedure TfNewList.LoadItems;
var
  i: Integer;
  s: ANSIString;
begin
  gFull.BeginUpdate;

  // pic := TPicture.Create;

  with tvRes.DataController do
  begin
    RecordCount := 1;
    Values[0, 0] := 0;
    Values[0, 2] := _GENERAL_;
  end;

  with tvFull.DataController do
  begin
    RecordCount := FullResList.Count - 1;
    for i := 1 to FullResList.Count - 1 do
    try
      Values[i - 1, 1] := i;
      if FullResList[i].IconFile <> '' then
      begin
        { pic.LoadFromFile(rootdir + '\resources\icons\' + FullResList[i]
          .IconFile);
          SavePicture(pic, S); }
        FileToString(rootdir + '\resources\icons\' + FullResList[i]
          .IconFile, s);
        Values[i - 1, 2] := s;
      end;
      { FileToString(rootdir+'\resources\icons\'+FullResLIst[i].IconFile) };
      Values[i - 1, 3] := FullResList[i].Name;
      // tvFull.DataController.
    except

    end;

  end;

  // pic.Free;
  gFull.EndUpdate;
end;

procedure TfNewList.pcMainChange(Sender: TObject);
begin
  with (Sender as TcxPageControl) do
  begin
    gRescButton.Visible := ActivePage = tsList;
    btnPrevious.Enabled := ActivePage = tsSettings;
    if ActivePage = tsSettings then
      btnNext.Caption := _FINISH_
    else
      btnNext.Caption := _NEXTSTEP_;
  end;
end;

procedure TfNewList.RemoveItem(index: Integer);
var
  i: Integer;
begin
  tvRes.BeginUpdate;
  tvFull.BeginUpdate;
  i := tvFull.DataController.RecordCount;
  tvFull.DataController.RecordCount := i + 1;
  tvFull.DataController.Values[i, 1] := tvRes.DataController.Values[index, 0];
  tvFull.DataController.Values[i, 2] := tvRes.DataController.Values[index, 1];
  tvFull.DataController.Values[i, 3] := tvRes.DataController.Values[index, 2];
  tvRes.DataController.DeleteRecord(index);
  tvRes.DataController.FocusedRecordIndex :=
    Min(index, tvRes.DataController.RecordCount - 1);
  tvRes.EndUpdate;
  tvFull.EndUpdate;

  btnNext.Enabled := tvRes.DataController.RowCount > 1;
end;

procedure TfNewList.ResetItems;
begin
  if pcMain.ActivePage = tsSettings then
    SaveSettings;
end;

procedure TfNewList.SaveSettings;
var
  i, n, d: Integer;
begin
  n := vgSettings.Tag;
  with FullResList[n] do
  begin
    Fields['tag'] := (vgSettings.RowByName('vgitag') as TcxEditorRow)
      .Properties.Value;

    NameFormat := (vgSettings.RowByName('vgidwpath') as TcxEditorRow)
      .Properties.Value;

    if vgSettings.Tag > 0 then
    begin
      Inherit := (vgSettings.RowByName('vgiinherit') as TcxEditorRow)
        .Properties.Value;
      d := FullResList[0].Fields.Count;
      if Fields.Count > d then
        with Fields do
          for i := d to Count - 1 do
          if Items[i].restype <> ftNone then

          begin
            Items[i].resvalue := (vgSettings.RowByName('evgi' + Items[i].resname)
              as TcxEditorRow).Properties.Value;
          end;
    end;
  end;
end;

procedure TfNewList.SetIntrfEnabled(b: boolean);
begin
  gFull.Enabled := b;
  gRes.Enabled := b;
  btnNext.Enabled := b;
  vgSettings.Enabled := b;
end;

procedure TfNewList.LoginCallBack(Sender: TObject; N: integer; Login,Password: String;
    const Cancel: boolean);
begin
  if Cancel then
  begin
    FLoggedOn := false;
    if not FullResList.ListFinished then
      FullResList.StartJob(JOB_STOPLIST)
    else
      fLogin.bOk.Enabled := true
  end else
  begin
    if ResetRelogin(N) then
    begin
      FLoggedOn := true;
      FullResList[n].Fields['login'] := Login;
      FullResList[n].Fields['password'] := Password;
      FullResLIst.StartJob(JOB_LOGIN);
    end else
      fLogin.Close;
  end;
end;

procedure TfNewList.SetLang;
begin
  btnPrevious.Caption := _PREVIOUSSTEP_;
  btnNext.Caption := _NEXTSTEP_;
end;

procedure TfNewList.tsSettingsShow(Sender: TObject);
begin
  if tvRes.Controller.FocusedRow = nil then
    tvRes.Controller.FocusedRowIndex := 0;
  CreateSettings(tvRes.Controller.FocusedRow.Values[0]);
end;

procedure TfNewList.tvFullcButtonPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  AddItem(tvFull.DataController.FocusedRecordIndex);
end;

procedure TfNewList.tvResFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if pcMain.ActivePage = tsSettings then
    CreateSettings(AFocusedRecord.Values[0]);
end;

initialization

end.