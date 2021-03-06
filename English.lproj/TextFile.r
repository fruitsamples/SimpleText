/*
	File:		TextFile.r

	Contains:	Text file support for simple text application

	Version:	Mac OS X

	Disclaimer:	IMPORTANT:  This Apple software is supplied to you by Apple Computer, Inc.
				("Apple") in consideration of your agreement to the following terms, and your
				use, installation, modification or redistribution of this Apple software
				constitutes acceptance of these terms.  If you do not agree with these terms,
				please do not use, install, modify or redistribute this Apple software.

				In consideration of your agreement to abide by the following terms, and subject
				to these terms, Apple grants you a personal, non-exclusive license, under Apple�s
				copyrights in this original Apple software (the "Apple Software"), to use,
				reproduce, modify and redistribute the Apple Software, with or without
				modifications, in source and/or binary forms; provided that if you redistribute
				the Apple Software in its entirety and without modifications, you must retain
				this notice and the following text and disclaimers in all such redistributions of
				the Apple Software.  Neither the name, trademarks, service marks or logos of
				Apple Computer, Inc. may be used to endorse or promote products derived from the
				Apple Software without specific prior written permission from Apple.  Except as
				expressly stated in this notice, no other rights or licenses, express or implied,
				are granted by Apple herein, including but not limited to any patent rights that
				may be infringed by your derivative works or by other works in which the Apple
				Software may be incorporated.

				The Apple Software is provided by Apple on an "AS IS" basis.  APPLE MAKES NO
				WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION THE IMPLIED
				WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS FOR A PARTICULAR
				PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND OPERATION ALONE OR IN
				COMBINATION WITH YOUR PRODUCTS.

				IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL OR
				CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
				GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
				ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION, MODIFICATION AND/OR DISTRIBUTION
				OF THE APPLE SOFTWARE, HOWEVER CAUSED AND WHETHER UNDER THEORY OF CONTRACT, TORT
				(INCLUDING NEGLIGENCE), STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN
				ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

	Copyright � 1993-2001 Apple Computer, Inc., All Rights Reserved
*/

#include "TextFile.h"

#ifdef USE_UMBRELLA_HEADERS && USE_UMBRELLA_HEADERS
#include "Carbon.r"
#else
#include "MacTypes.r"
#include "Dialogs.r"
#endif

#include "Localize.r"

resource 'STR#' (kTextStrings, purgeable) {
	{
	SOUNDSPEAKSELECTIONITEM;
	SOUNDSPEAKALLITEM;
	
	TEXTSTATIONERY;
	TEXTSTATIONERYSELECTED;
	TEXTDOCUMENT;
	TEXTDOCUMENTSELECTED;
	
	TEXTPICTMARKER1;
	TEXTPICTMARKER2;
	};
};

resource 'DLOG' (kTextSaveAsDialogID) {
	{0, 0, 238, 344},
	dBoxProc,
	invisible,
	noGoAway,
	'tmDI',
	kTextSaveAsDialogID,
	"",
	alertPositionMainScreen
};

resource 'dlgx' (kTextSaveAsDialogID) {
	versionZero {
		kDialogFlagsUseThemeBackground 	+ kDialogFlagsUseControlHierarchy + kDialogFlagsUseThemeControls
	};
};

resource 'dctb' (kTextSaveAsDialogID, purgeable) {
	 {};
};

resource 'DITL' (kTextSaveAsDialogID) {
	{	/* array DITLarray: 17 elements */
		/* [1] */
		{161, 252, 181, 332},
		Button {
			enabled,
			TEXTSAVEBUTTON
		},
		/* [2] */
		{130, 252, 150, 332},
		Button {
			enabled,
			TEXTCANCELBUTTON
		},
		/* [3] */
		{-1, -1, -1, -1},
		HelpItem {
			disabled,
			HMScanhdlg {
				-6043
			}
		},
		/* [4] */
		{8, 235, 24, 337},
		UserItem {
			enabled
		},
		/* [5] */
		{32, 252, 52, 332},
		Button {
			enabled,
			TEXTEJECTBUTTON
		},
		/* [6] */
		{60, 252, 80, 332},
		Button {
			enabled,
			TEXTDESKTOPBUTTON
		},
		/* [7] */
		{29, 12, 175, 230},
		UserItem {
			enabled
		},
		/* [8] */
		{7, 12, 26, 230},
		UserItem {
			enabled
		},
		/* [9] */
		{117, 250, 118, 334},
		Picture {
			disabled,
			11
		},
		/* [10] */
		{209, 15, 225, 211},
		EditText {
			enabled,
			""
		},
		/* [11] */
		{188, 15, 204, 211},
		StaticText {
			disabled,
			TEXTSAVEPROMPT
		},
		/* [12] */
		{87, 252, 107, 332},
		UserItem {
			disabled
		},
		/* [13] */
		{-2, -2, -2, -2},
		HelpItem {
			disabled,
			HMScanhdlg {
				kTextSaveAsDialogID
			}
		},
		/* [14] */
		{196, 232, 228, 280},
		RadioButton {
			enabled,
			""
		},
		/* [15] */
		{196, 288, 228, 336},
		RadioButton {
			enabled,
			""
		},
		/* [16] */
		{196, 248, 228, 280},
		UserItem {
			enabled,
		},
		/* [17] */
		{196, 304, 228, 336},
		UserItem {
			enabled,
		}
	}
};

#if CALL_NOT_IN_CARBON
// this is extra help for our save as dialog
resource 'hdlg' (kTextSaveAsDialogID) {
	HelpMgrVersion,							/* Help Version */
	13,										/* offset to first DITL */
	0,										/* options */
	0,										/* theProc */
	0,										/* variant */
	HMSkipItem {},
	{
		HMStringResItem {
			{0,0},
			{0,0,0,0},
			kTextStrings, iDocumentHelp,
			kTextStrings, 0,
			kTextStrings, iDocumentSelectedHelp,
			kTextStrings, 0
		},
		HMStringResItem {
			{0,0},
			{0,0,0,0},
			kTextStrings, iStationeryHelp,
			kTextStrings, 0,
			kTextStrings, iStationerySelectedHelp,
			kTextStrings, 0
		},
	}
};
#endif

