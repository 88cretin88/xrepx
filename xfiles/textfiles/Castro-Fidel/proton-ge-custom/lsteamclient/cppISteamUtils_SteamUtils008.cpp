#include "steam_defs.h"
#pragma push_macro("__cdecl")
#undef __cdecl
#include "steamworks_sdk_139/steam_api.h"
#pragma pop_macro("__cdecl")
#include "steamclient_private.h"
#ifdef __cplusplus
extern "C" {
#endif
#define SDKVER_139
#include "struct_converters.h"
#include "cppISteamUtils_SteamUtils008.h"
uint32 cppISteamUtils_SteamUtils008_GetSecondsSinceAppActive(void *linux_side)
{
    return ((ISteamUtils*)linux_side)->GetSecondsSinceAppActive();
}

uint32 cppISteamUtils_SteamUtils008_GetSecondsSinceComputerActive(void *linux_side)
{
    return ((ISteamUtils*)linux_side)->GetSecondsSinceComputerActive();
}

EUniverse cppISteamUtils_SteamUtils008_GetConnectedUniverse(void *linux_side)
{
    return ((ISteamUtils*)linux_side)->GetConnectedUniverse();
}

uint32 cppISteamUtils_SteamUtils008_GetServerRealTime(void *linux_side)
{
    return ((ISteamUtils*)linux_side)->GetServerRealTime();
}

const char * cppISteamUtils_SteamUtils008_GetIPCountry(void *linux_side)
{
    return ((ISteamUtils*)linux_side)->GetIPCountry();
}

bool cppISteamUtils_SteamUtils008_GetImageSize(void *linux_side, int iImage, uint32 * pnWidth, uint32 * pnHeight)
{
    return ((ISteamUtils*)linux_side)->GetImageSize((int)iImage, (uint32 *)pnWidth, (uint32 *)pnHeight);
}

bool cppISteamUtils_SteamUtils008_GetImageRGBA(void *linux_side, int iImage, uint8 * pubDest, int nDestBufferSize)
{
    return ((ISteamUtils*)linux_side)->GetImageRGBA((int)iImage, (uint8 *)pubDest, (int)nDestBufferSize);
}

bool cppISteamUtils_SteamUtils008_GetCSERIPPort(void *linux_side, uint32 * unIP, uint16 * usPort)
{
    return ((ISteamUtils*)linux_side)->GetCSERIPPort((uint32 *)unIP, (uint16 *)usPort);
}

uint8 cppISteamUtils_SteamUtils008_GetCurrentBatteryPower(void *linux_side)
{
    return ((ISteamUtils*)linux_side)->GetCurrentBatteryPower();
}

uint32 cppISteamUtils_SteamUtils008_GetAppID(void *linux_side)
{
    return ((ISteamUtils*)linux_side)->GetAppID();
}

void cppISteamUtils_SteamUtils008_SetOverlayNotificationPosition(void *linux_side, ENotificationPosition eNotificationPosition)
{
    ((ISteamUtils*)linux_side)->SetOverlayNotificationPosition((ENotificationPosition)eNotificationPosition);
}

bool cppISteamUtils_SteamUtils008_IsAPICallCompleted(void *linux_side, SteamAPICall_t hSteamAPICall, bool * pbFailed)
{
    return ((ISteamUtils*)linux_side)->IsAPICallCompleted((SteamAPICall_t)hSteamAPICall, (bool *)pbFailed);
}

ESteamAPICallFailure cppISteamUtils_SteamUtils008_GetAPICallFailureReason(void *linux_side, SteamAPICall_t hSteamAPICall)
{
    return ((ISteamUtils*)linux_side)->GetAPICallFailureReason((SteamAPICall_t)hSteamAPICall);
}

bool cppISteamUtils_SteamUtils008_GetAPICallResult(void *linux_side, SteamAPICall_t hSteamAPICall, void * pCallback, int cubCallback, int iCallbackExpected, bool * pbFailed)
{
    return ((ISteamUtils*)linux_side)->GetAPICallResult((SteamAPICall_t)hSteamAPICall, (void *)pCallback, (int)cubCallback, (int)iCallbackExpected, (bool *)pbFailed);
}

void cppISteamUtils_SteamUtils008_RunFrame(void *linux_side)
{
    ((ISteamUtils*)linux_side)->RunFrame();
}

uint32 cppISteamUtils_SteamUtils008_GetIPCCallCount(void *linux_side)
{
    return ((ISteamUtils*)linux_side)->GetIPCCallCount();
}

void cppISteamUtils_SteamUtils008_SetWarningMessageHook(void *linux_side, SteamAPIWarningMessageHook_t pFunction)
{
    ((ISteamUtils*)linux_side)->SetWarningMessageHook((SteamAPIWarningMessageHook_t)pFunction);
}

bool cppISteamUtils_SteamUtils008_IsOverlayEnabled(void *linux_side)
{
    return ((ISteamUtils*)linux_side)->IsOverlayEnabled();
}

bool cppISteamUtils_SteamUtils008_BOverlayNeedsPresent(void *linux_side)
{
    return ((ISteamUtils*)linux_side)->BOverlayNeedsPresent();
}

SteamAPICall_t cppISteamUtils_SteamUtils008_CheckFileSignature(void *linux_side, const char * szFileName)
{
    return ((ISteamUtils*)linux_side)->CheckFileSignature((const char *)szFileName);
}

bool cppISteamUtils_SteamUtils008_ShowGamepadTextInput(void *linux_side, EGamepadTextInputMode eInputMode, EGamepadTextInputLineMode eLineInputMode, const char * pchDescription, uint32 unCharMax, const char * pchExistingText)
{
    return ((ISteamUtils*)linux_side)->ShowGamepadTextInput((EGamepadTextInputMode)eInputMode, (EGamepadTextInputLineMode)eLineInputMode, (const char *)pchDescription, (uint32)unCharMax, (const char *)pchExistingText);
}

uint32 cppISteamUtils_SteamUtils008_GetEnteredGamepadTextLength(void *linux_side)
{
    return ((ISteamUtils*)linux_side)->GetEnteredGamepadTextLength();
}

bool cppISteamUtils_SteamUtils008_GetEnteredGamepadTextInput(void *linux_side, char * pchText, uint32 cchText)
{
    return ((ISteamUtils*)linux_side)->GetEnteredGamepadTextInput((char *)pchText, (uint32)cchText);
}

const char * cppISteamUtils_SteamUtils008_GetSteamUILanguage(void *linux_side)
{
    return ((ISteamUtils*)linux_side)->GetSteamUILanguage();
}

bool cppISteamUtils_SteamUtils008_IsSteamRunningInVR(void *linux_side)
{
    return ((ISteamUtils*)linux_side)->IsSteamRunningInVR();
}

void cppISteamUtils_SteamUtils008_SetOverlayNotificationInset(void *linux_side, int nHorizontalInset, int nVerticalInset)
{
    ((ISteamUtils*)linux_side)->SetOverlayNotificationInset((int)nHorizontalInset, (int)nVerticalInset);
}

bool cppISteamUtils_SteamUtils008_IsSteamInBigPictureMode(void *linux_side)
{
    return ((ISteamUtils*)linux_side)->IsSteamInBigPictureMode();
}

void cppISteamUtils_SteamUtils008_StartVRDashboard(void *linux_side)
{
    ((ISteamUtils*)linux_side)->StartVRDashboard();
}

#ifdef __cplusplus
}
#endif
