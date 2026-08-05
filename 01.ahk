; ============================================================
;  Default Audio Device Switcher - 01
;  소리 제어판을 열어 재생 장치 목록에서 지정 위치의 장치를
;  기본 재생 장치로 설정한다.
;
;  대상 : 한국어 Windows + AutoHotkey v1.1
;  사용 : 이 스크립트(또는 컴파일한 01.exe)를 실행하면
;         현재 선택 기준 한 칸 아래 장치가 기본값이 된다.
;  참고 : 02.ahk 는 동일한 구조에 선택 위치만 다르게 하여
;         두 번째 장치용으로 사용한다.
; ============================================================
; <COMPILER: v1.1.11.00>

#NoEnv
#SingleInstance, Force
SetTitleMatchMode, 2          ; "소리"가 포함된 창이면 매칭

; 1) 소리 제어판 열기
Run, mmsys.cpl

; 2) "소리" 창 대기 (최대 5초, 못 찾으면 종료)
WinWait, 소리,, 5
if ErrorLevel
{
    MsgBox, 48, 오류, 소리 제어판 창을 찾지 못했습니다.
    ExitApp
}
WinActivate, 소리

; 3) 장치 목록에서 선택을 아래로 1칸 이동 → 원하는 장치 선택
ControlSend, SysListView321, {Down 1}, 소리

; 4) 기본값으로 설정 후 확인
ControlClick, 기본값으로 설정, 소리
ControlClick, 확인, 소리

return
