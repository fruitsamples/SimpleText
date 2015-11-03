#
#	File:		SimpleText.make
#
#	Contains:	Make instructions for SimpleText
#
#	Written by:	Tom Dowdy
#
#	Copyright:	� 1997 by Apple Computer, Inc., all rights reserved.
#
#	$Log: SimpleText.make,v $
#	Revision 1.1.1.1  1998/03/18 22:56:12  ivory
#	Initial checkin of SimpleText.
#	
#		
#		8     8/12/97 4:03 PM Tom Dowdy
#		Removed dump file crap, wasn't working anyway with MW.
#		
#		7     8/11/97 3:56 PM Tom Dowdy
#		dumpfile
#		
#		6     8/11/97 3:49 PM Tom Dowdy
#		dumpfile
#		
#		5     8/11/97 3:04 PM Tom Dowdy
#		rolling in nav services
#		
#		4     7/29/97 5:51 PM Tom Dowdy
#		Now we build!
#		
#		3     7/29/97 5:19 PM Tom Dowdy
#		New version checked in
#		
#		2     7/29/97 3:37 PM Duane Byram
#		make it work within QTML sources.
#		
#		1     7/29/97 2:23 PM Tom Dowdy
#		first checked in
#
#
#

###-------------------------------------------------------------------------------

%ifdef NoMakeFileDependencies
SimpleTextMakefile = ""
%else
SimpleTextMakefile = "{SimpleTextSources}Make:SimpleText.make"
%endif

###-------------------------------------------------------------------------------

SimpleTextFileCreator = ttxt
SimpleTextFileType = APPL

# defaults for SimpleText
SimpleTextVersion = 1.0
STCopyrightStartYear = 1989

# added to variables defined in {QTMLSources}Make:Build
STCopyrightString = ^{QTBuildRevision}, � Apple Computer, Inc. {STCopyrightStartYear}-{CurrentYear}
STBuildVersion = "{SimpleTextVersion}{QTBuildVersion}"

#MakeMacDump = -dMakeMacDump=1 
#UseMacDump = -dUseMacDump=1 
UseMacDump =
MakeMacDump =

###-------------------------------------------------------------------------------

SimpleText						�	{QTMLBuildResults}SimpleText


{QTMLBuildResults}SimpleText	�	"{OutputDir}SimpleText"
	Duplicate -y "{OutputDir}SimpleText" {Targ}
	beep 1300,3,25 0,1,0  1200,3,25 0,1,0 1100,3,25 0,1,0  1000,3,25

###-------------------------------------------------------------------------------

SimpleTextFeatureSet	�

###-------------------------------------------------------------------------------

##
## Indicate the source files.
##
SimpleTextObjDir = "{ObjDir}SimpleText:"

SimpleTextObjects =												�
			{SimpleTextObjDir}AboutBox.c.o						�
			{SimpleTextObjDir}Clipboard.c.o						�
			{SimpleTextObjDir}GXFile.c.o						�
			{SimpleTextObjDir}MovieFile.c.o						�
			{SimpleTextObjDir}PICTFile.c.o						�
			{SimpleTextObjDir}SimpleText.c.o					�
			{SimpleTextObjDir}TextDrag.c.o						�
			{SimpleTextObjDir}TextFile.c.o						�
			{SimpleTextObjDir}ThreeDMetafile.c.o				�
			{SimpleTextObjDir}TextFile.a.o						�
			{SimpleTextObjDir}NavigationServicesSupport.c.o		�
			{SimpleTextSources}Navigation.o						�
			{SimpleTextSources}AGFileLib.o
			
###-------------------------------------------------------------------------------

## Linking
"{OutputDir}SimpleText" �� {SimpleTextMakefile} {SimpleTextObjects}
	Link {SimpleTextObjects} 									�
		{StdLibs}												�
		"{Libraries}"StdCLib.o									�
		{StdLOpts} -br on -srtsg all							�
		-t {SimpleTextFileType} -c {SimpleTextFileCreator} -o "{OutputDir}SimpleText"
	If {SCMBuild}		# Timestamp and set vers 1 of the build for SCM
		DelResNames -p {Targ}
		SetTime -d {Targ}
		Echo "Delete 'vers';" | Rez -m -a -o {Targ}
		SetVersion -t 'vers' -i 1 -version {STBuildVersion} -verstring "{STCopyrightString}" {Targ} � Dev:Null
	Else				# for others set vers 1 AND 2
		Echo "Delete 'vers';" | Rez -m -a -o {Targ}
		SetVersion -t 'vers' -i 1 -version {STBuildVersion} -verstring "{STCopyrightString}" {Targ} � Dev:Null
		SetVersion -t 'vers' -i 2 -version {STBuildVersion} -verstring "CONFIDENTIAL - Do Not Distribute" {Targ} � Dev:Null
	End
	
"{OutputDir}SimpleText" �� {SimpleTextMakefile} "{SimpleTextSources}SimpleText.r"
	Rez "{SimpleTextSources}SimpleText.r"						�
		{StdROpts} -d SystemSevenOrLater=1 -append -t {SimpleTextFileType} -c {SimpleTextFileCreator} -o "{OutputDir}SimpleText"
	
	
###-------------------------------------------------------------------------------

## C files

"{SimpleTextObjDir}DumpCompile.c.o" � {SimpleTextMakefile} "{SimpleTextSources}DumpCompile.c" "{SimpleTextSources}"MacIncludes.h
	C {StdCOpts} {MakeMacDump} "{SimpleTextSources}DumpCompile.c" -o "{SimpleTextObjDir}DumpCompile.c.o"

"{SimpleTextObjDir}AboutBox.c.o" � {SimpleTextMakefile} "{SimpleTextSources}AboutBox.c"
	C {StdCOpts} {UseMacDump} "{SimpleTextSources}AboutBox.c" -o "{SimpleTextObjDir}AboutBox.c.o"
	
"{SimpleTextObjDir}Clipboard.c.o" � {SimpleTextMakefile} "{SimpleTextSources}Clipboard.c"
	C {StdCOpts} {UseMacDump} "{SimpleTextSources}Clipboard.c" -o "{SimpleTextObjDir}Clipboard.c.o"
	
"{SimpleTextObjDir}GXFile.c.o" � {SimpleTextMakefile} "{SimpleTextSources}GXFile.c"
	C {StdCOpts} {UseMacDump} "{SimpleTextSources}GXFile.c" -o "{SimpleTextObjDir}GXFile.c.o"
	
"{SimpleTextObjDir}MovieFile.c.o" � {SimpleTextMakefile} "{SimpleTextSources}MovieFile.c"
	C {StdCOpts} {UseMacDump} "{SimpleTextSources}MovieFile.c" -o "{SimpleTextObjDir}MovieFile.c.o"
	
"{SimpleTextObjDir}PICTFile.c.o" � {SimpleTextMakefile} "{SimpleTextSources}PICTFile.c"
	C {StdCOpts} {UseMacDump} "{SimpleTextSources}PICTFile.c" -o "{SimpleTextObjDir}PICTFile.c.o"
	
"{SimpleTextObjDir}SimpleText.c.o" � {SimpleTextMakefile} "{SimpleTextSources}SimpleText.c"
	C {StdCOpts} {UseMacDump} "{SimpleTextSources}SimpleText.c" -o "{SimpleTextObjDir}SimpleText.c.o"
	
"{SimpleTextObjDir}TextDrag.c.o" � {SimpleTextMakefile} "{SimpleTextSources}TextDrag.c"
	C {StdCOpts} {UseMacDump} "{SimpleTextSources}TextDrag.c" -o "{SimpleTextObjDir}TextDrag.c.o"
	
"{SimpleTextObjDir}TextFile.c.o" � {SimpleTextMakefile} "{SimpleTextSources}TextFile.c"
	C {StdCOpts} {UseMacDump} "{SimpleTextSources}TextFile.c" -o "{SimpleTextObjDir}TextFile.c.o"
	
"{SimpleTextObjDir}TextFile.a.o" � {SimpleTextMakefile} "{SimpleTextSources}TextFile.a"
	Asm {StdAOpts} "{SimpleTextSources}TextFile.a" -o "{SimpleTextObjDir}TextFile.a.o"
	
"{SimpleTextObjDir}ThreeDMetafile.c.o" � {SimpleTextMakefile} "{SimpleTextSources}ThreeDMetafile.c"
	C {StdCOpts} {UseMacDump} "{SimpleTextSources}ThreeDMetafile.c" -o "{SimpleTextObjDir}ThreeDMetafile.c.o"
	
"{SimpleTextObjDir}NavigationServicesSupport.c.o" � {SimpleTextMakefile} "{SimpleTextSources}NavigationServicesSupport.c"
	C {StdCOpts} {UseMacDump} "{SimpleTextSources}NavigationServicesSupport.c" -o "{SimpleTextObjDir}NavigationServicesSupport.c.o"
	
