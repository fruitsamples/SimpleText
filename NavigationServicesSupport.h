/*
	File:		NavigationServicesSupport.h

	Contains:	Code to support Navigation Services in SimpleText

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

	Copyright � 1997-2001 Apple Computer, Inc., All Rights Reserved
*/

#if defined(USE_UMBRELLA_HEADERS) && USE_UMBRELLA_HEADERS
#include <Carbon.h>
#else
#include <Files.h>
#include <Navigation.h>
#endif

#define dontSaveChanges	3

 
 
OSStatus OpenFileDialog(
	OSType applicationSignature, 
	short numTypes, 
	OSType typeList[], 
	NavDialogRef *outDialog );
// Displays the NavGetFile modeless dialog. Safe to call multple times,
// if the dialog is already displayed, it will come to the front.
 
 
void TerminateOpenFileDialog();
// Closes the OpenFileDialog, if there is one. Call when the app is quitting


void TerminateDialog( NavDialogRef inDialog );
// Closes the referenced dialog


OSStatus ConfirmSaveDialog(
	WindowRef parentWindow, 
	CFStringRef documentName, 
	Boolean quitting, 
	void* inContextData,
	NavDialogRef *outDialog );
// Displays the save confirmation dialog attached to the parent window

  
OSStatus ModalConfirmSaveDialog(
	CFStringRef documentName, 
	Boolean quitting, 
	NavUserAction *outUserAction );
// Display a modal confirmation dialog, returns the user action
	

OSStatus SaveFileDialog(
	WindowRef parentWindow, 
	CFStringRef documentName, 
	OSType filetype, 
	OSType fileCreator, 
	void *inContextData,
	NavDialogRef *outDialog );
// Displays the NavPutFile dialog attached to the parent window


OSStatus BeginSave( NavDialogRef inDialog, NavReplyRecord* outReply, FSRef* outFileRef );
// Call BeginSave when you're ready to write the file. It will create the
// data fork for you and return the FSSpec to it. Pass the reply record
// to CompleteSave after writing the file.


OSStatus CompleteSave( NavReplyRecord* inReply, FSRef* inFileRef, Boolean inDidWriteFile );
// Call CompleteSave after savibg a documen,t passing back the reply returned by 
// BeginSave. This call performs any file tranlation needed and disposes the reply.
// If the save didn't succeed, pass false for inDidWriteFile to avoid
// translation but still dispose the reply.
 
