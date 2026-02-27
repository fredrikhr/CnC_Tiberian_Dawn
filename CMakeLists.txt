cmake_minimum_required(VERSION 3.30)
project(
    CnC_Tiberian_Dawn
    DESCRIPTION "Command & Conquer Tiberian Dawn"
    HOMEPAGE_URL "https://github.com/electronicarts/CnC_Tiberian_Dawn"
    LANGUAGES C CXX ASM_MASM
)
set(CACHE{CMAKE_ASM_MASM_COMPILE_OPTIONS_MSVC_DEBUG_INFORMATION_FORMAT_ProgramDatabase}
  TYPE STRING
  VALUE "/Zd"
)
add_library(PROJECT_DEFAULT INTERFACE)
target_compile_definitions(PROJECT_DEFAULT INTERFACE
  $<$<CONFIG:Debug>:DEBUG>
  $<$<CONFIG:Debug>:_DEBUG>
)

add_executable(CWSTUB EXCLUDE_FROM_ALL)
target_link_libraries(CWSTUB PRIVATE PROJECT_DEFAULT)
target_compile_definitions(CWSTUB
  PRIVATE
    QUIET
    VMM
)
target_sources(CWSTUB
  PRIVATE
    CWSTUB.c
)

add_executable(CONQUER WIN32)
target_link_libraries(CONQUER PRIVATE PROJECT_DEFAULT)
target_sources(CONQUER
  PRIVATE
    "SUPER.CPP"
    "AADATA.CPP"
    "WINSTUB.CPP"
    "WINASM.ASM"
    "ABSTRACT.CPP"
    "ADATA.CPP"
    "AIRCRAFT.CPP"
    "ANIM.CPP"
    "AUDIO.CPP"
    "BASE.CPP"
    "BBDATA.CPP"
    "BDATA.CPP"
    "BUILDING.CPP"
    "BULLET.CPP"
    "CARGO.CPP"
    "CCFILE.CPP"
    "CDATA.CPP"
    "CDFILE.CPP"
    "CELL.CPP"
    "CHECKBOX.CPP"
    "CHEKLIST.CPP"
    "COLRLIST.CPP"
    "COMBAT.CPP"
    "COMBUF.CPP"
    "CONFDLG.CPP"
    "CONNECT.CPP"
    "CONQUER.CPP"
    "CONST.CPP"
    "CONTROL.CPP"
    "COORD.CPP"
    "CREDITS.CPP"
    "CREW.CPP"
    "DEBUG.CPP"
    "DIAL8.CPP"
    "DIALOG.CPP"
    "DISPLAY.CPP"
    "DOOR.CPP"
    "DRIVE.CPP"
    "EDIT.CPP"
    "EVENT.CPP"
    "ENDING.CPP"
    "EXPAND.CPP"
    "FACING.CPP"
    "FACTORY.CPP"
    "FINDPATH.CPP"
    "FLASHER.CPP"
    "FLY.CPP"
    "FOOT.CPP"
    "FUSE.CPP"
    "GADGET.CPP"
    "GAMEDLG.CPP"
    "GAUGE.CPP"
    "GLOBALS.CPP"
    "GOPTIONS.CPP"
    "GSCREEN.CPP"
    "HDATA.CPP"
    "HEAP.CPP"
    "HELP.CPP"
    "HOUSE.CPP"
    "IDATA.CPP"
    "INFANTRY.CPP"
    "INI.CPP"
    "INIT.CPP"
    "INTERNET.CPP"
    "INTERPAL.CPP"
    "INTRO.CPP"
    "IOMAP.CPP"
    "IOOBJ.CPP"
    "IPX.CPP"
    "IPXADDR.CPP"
    "IPXCONN.CPP"
    "IPXGCONN.CPP"
    "IPXMGR.CPP"
    "IPX95.CPP"
    "JSHELL.CPP"
    "KEYFBUFF.ASM"
    "KEYFRAME.CPP"
    "LAYER.CPP"
    "LINK.CPP"
    "LIST.CPP"
    "LOADDLG.CPP"
    "LOGIC.CPP"
    "MAP.CPP"
    "MAPEDDLG.CPP"
    "MAPEDIT.CPP"
    "MAPEDPLC.CPP"
    "MAPEDTM.CPP"
    "MAPSEL.CPP"
    "MENUS.CPP"
    "MISSION.CPP"
    "MIXFILE.CPP"
    "MOUSE.CPP"
    "MPLAYER.CPP"
    "MSGBOX.CPP"
    "MSGLIST.CPP"
    "NETDLG.CPP"
    "NOSEQCON.CPP"
    "NULLCONN.CPP"
    "NULLDLG.CPP"
    "NULLMGR.CPP"
    "OBJECT.CPP"
    "ODATA.CPP"
    "OPTIONS.CPP"
    "OVERLAY.CPP"
    "POWER.CPP"
    "PROFILE.CPP"
    "QUEUE.CPP"
    "RADAR.CPP"
    "RADIO.CPP"
    "RAND.CPP"
    "REINF.CPP"
    "SAVELOAD.CPP"
    "SCENARIO.CPP"
    "SCORE.CPP"
    "SCROLL.CPP"
    "SDATA.CPP"
    "SHAPEBTN.CPP"
    "SIDEBAR.CPP"
    "SLIDER.CPP"
    "SMUDGE.CPP"
    "SOUNDDLG.CPP"
    "SPECIAL.CPP"
    "STARTUP.CPP"
    "SUPPORT.ASM"
    "TAB.CPP"
    "TARCOM.CPP"
    "TARGET.CPP"
    "TCPIP.CPP"
    "TDATA.CPP"
    "TEAM.CPP"
    "TEAMTYPE.CPP"
    "TECHNO.CPP"
    "TEMPLATE.CPP"
    "TERRAIN.CPP"
    "TEXTBTN.CPP"
    "THEME.CPP"
    "TOGGLE.CPP"
    "TRIGGER.CPP"
    "TURRET.CPP"
    "TXTLABEL.CPP"
    "TXTPRNT.ASM"
    "UDATA.CPP"
    "UNIT.CPP"
    "VECTOR.CPP"
    "VISUDLG.CPP"
    "UTRACKER.CPP"
    "PACKET.CPP"
    "FIELD.CPP"
    "STATS.CPP"
    "CCDDE.CPP"
    "DDE.CPP"
    # "ALLOC.CPP"
    # "DESCDLG.CPP"
    # "COORDA.ASM"
    "MMX.ASM"
    CC_ICON.RC
    REG_ICON.RC
    CONQUER.DEF
  PRIVATE
    FILE_SET HEADERS
    FILES
      defines.h function.h externs.h conquer.h vector.h heap.h
      debug.h jshell.h compat.h
      facing.h techno.h mission.h stage.h cargo.h object.h abstract.h
      unit.h tarcom.h turret.h drive.h foot.h radio.h
      infantry.h foot.h radio.h
      aircraft.h fly.h radio.h
      building.h radio.h
      bullet.h fly.h fuse.h object.h abstract.h
      base.h mapedit.h mouse.h scroll.h help.h tab.h power.h sidebar.h
      radar.h display.h map.h gscreen.h cell.h
      textbtn.h shapebtn.h slider.h gauge.h dial8.h edit.h
      toggle.h list.h cheklist.h control.h gadget.h link.h
      ccfile.h cdfile.h mixfile.h rawfile.h wwfile.h link.h
      team.h teamtype.h trigger.h
      ipx.h ipxaddr.h
      combuf.h connect.h connmgr.h ipx.h ipxaddr.h ipxconn.h ipxgconn.h
      ipxmgr.h noseqcon.h nullconn.h nullmgr.h
      ftimer.h logic.h score.h theme.h event.h queue.h special.h
      CC_ICON.RH
      REG_ICON.RH
      FUNCTION.I
)
set_source_files_properties(
  COORDA.ASM
  IPXPROT.ASM
  IPXREAL.ASM
  KEYFBUFF.ASM
  MMX.ASM
  PAGFAULT.ASM
  SUPPORT.ASM
  TXTPRNT.ASM
  WINASM.ASM
  FUNCTION.I
  PROPERTIES
    LANGUAGE ASM_MASM
)