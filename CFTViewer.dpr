// JCL_DEBUG_EXPERT_GENERATEJDBG ON
// JCL_DEBUG_EXPERT_INSERTJDBG ON
program CFTViewer;

uses
  Forms,
  uMain in 'uMain.pas' {frmMain},
  uEditMethod in 'uEditMethod.pas' {frmEditMethod},
  dlgSearchText in 'dlgSearchText.pas' {TextSearchDialog},
  uLine in 'uLine.pas' {frmLine},
  uSearchObj in 'uSearchObj.pas' {frmSearchObj},
  uWait in 'uWait.pas' {frmWait},
  uClass in 'uClass.pas',
  uStructMDB in 'uStructMDB.pas',
  uRename in 'uRename.pas' {frmRename},
  uRenameFunc in 'uRenameFunc.pas',
  uFormShow in 'uFormShow.pas' {FormShow},
  uEditSetting in 'uEditSetting.pas' {frmEditSetting},
  uSimpleTextPLPlus in 'uSimpleTextPLPlus.pas' {frmSimpleTextPLPlus},
  uEditIndex in 'uEditIndex.pas' {frmEditIndex},
  uEditCriteria in 'uEditCriteria.pas' {frmEditCriteria},
  uShowAttrCrit in 'uShowAttrCrit.pas' {frmShowAttrCrit},
  uDBGridExt in 'uDBGridExt.pas',
  uExceptionhandler in 'uExceptionhandler.pas' {frmError},
  uSourceFunc in 'uSourceFunc.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Просмотр хранилищ';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
