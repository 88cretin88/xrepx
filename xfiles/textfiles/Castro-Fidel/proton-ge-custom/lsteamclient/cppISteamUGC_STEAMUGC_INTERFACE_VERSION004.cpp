#include "steam_defs.h"
#pragma push_macro("__cdecl")
#undef __cdecl
#include "steamworks_sdk_132x/steam_api.h"
#pragma pop_macro("__cdecl")
#include "steamclient_private.h"
#ifdef __cplusplus
extern "C" {
#endif
#define SDKVER_132x
#include "struct_converters.h"
#include "cppISteamUGC_STEAMUGC_INTERFACE_VERSION004.h"
UGCQueryHandle_t cppISteamUGC_STEAMUGC_INTERFACE_VERSION004_CreateQueryUserUGCRequest(void *linux_side, AccountID_t unAccountID, EUserUGCList eListType, EUGCMatchingUGCType eMatchingUGCType, EUserUGCListSortOrder eSortOrder, AppId_t nCreatorAppID, AppId_t nConsumerAppID, uint32 unPage)
{
    return ((ISteamUGC*)linux_side)->CreateQueryUserUGCRequest((AccountID_t)unAccountID, (EUserUGCList)eListType, (EUGCMatchingUGCType)eMatchingUGCType, (EUserUGCListSortOrder)eSortOrder, (AppId_t)nCreatorAppID, (AppId_t)nConsumerAppID, (uint32)unPage);
}

UGCQueryHandle_t cppISteamUGC_STEAMUGC_INTERFACE_VERSION004_CreateQueryAllUGCRequest(void *linux_side, EUGCQuery eQueryType, EUGCMatchingUGCType eMatchingeMatchingUGCTypeFileType, AppId_t nCreatorAppID, AppId_t nConsumerAppID, uint32 unPage)
{
    return ((ISteamUGC*)linux_side)->CreateQueryAllUGCRequest((EUGCQuery)eQueryType, (EUGCMatchingUGCType)eMatchingeMatchingUGCTypeFileType, (AppId_t)nCreatorAppID, (AppId_t)nConsumerAppID, (uint32)unPage);
}

SteamAPICall_t cppISteamUGC_STEAMUGC_INTERFACE_VERSION004_SendQueryUGCRequest(void *linux_side, UGCQueryHandle_t handle)
{
    return ((ISteamUGC*)linux_side)->SendQueryUGCRequest((UGCQueryHandle_t)handle);
}

bool cppISteamUGC_STEAMUGC_INTERFACE_VERSION004_GetQueryUGCResult(void *linux_side, UGCQueryHandle_t handle, uint32 index, winSteamUGCDetails_t_132x * pDetails)
{
    SteamUGCDetails_t lin_pDetails;
    win_to_lin_struct_SteamUGCDetails_t_132x(pDetails, &lin_pDetails);
    bool retval = ((ISteamUGC*)linux_side)->GetQueryUGCResult((UGCQueryHandle_t)handle, (uint32)index, &lin_pDetails);
    lin_to_win_struct_SteamUGCDetails_t_132x(&lin_pDetails, pDetails);
    return retval;
}

bool cppISteamUGC_STEAMUGC_INTERFACE_VERSION004_ReleaseQueryUGCRequest(void *linux_side, UGCQueryHandle_t handle)
{
    return ((ISteamUGC*)linux_side)->ReleaseQueryUGCRequest((UGCQueryHandle_t)handle);
}

bool cppISteamUGC_STEAMUGC_INTERFACE_VERSION004_AddRequiredTag(void *linux_side, UGCQueryHandle_t handle, const char * pTagName)
{
    return ((ISteamUGC*)linux_side)->AddRequiredTag((UGCQueryHandle_t)handle, (const char *)pTagName);
}

bool cppISteamUGC_STEAMUGC_INTERFACE_VERSION004_AddExcludedTag(void *linux_side, UGCQueryHandle_t handle, const char * pTagName)
{
    return ((ISteamUGC*)linux_side)->AddExcludedTag((UGCQueryHandle_t)handle, (const char *)pTagName);
}

bool cppISteamUGC_STEAMUGC_INTERFACE_VERSION004_SetReturnLongDescription(void *linux_side, UGCQueryHandle_t handle, bool bReturnLongDescription)
{
    return ((ISteamUGC*)linux_side)->SetReturnLongDescription((UGCQueryHandle_t)handle, (bool)bReturnLongDescription);
}

bool cppISteamUGC_STEAMUGC_INTERFACE_VERSION004_SetReturnTotalOnly(void *linux_side, UGCQueryHandle_t handle, bool bReturnTotalOnly)
{
    return ((ISteamUGC*)linux_side)->SetReturnTotalOnly((UGCQueryHandle_t)handle, (bool)bReturnTotalOnly);
}

bool cppISteamUGC_STEAMUGC_INTERFACE_VERSION004_SetAllowCachedResponse(void *linux_side, UGCQueryHandle_t handle, uint32 unMaxAgeSeconds)
{
    return ((ISteamUGC*)linux_side)->SetAllowCachedResponse((UGCQueryHandle_t)handle, (uint32)unMaxAgeSeconds);
}

bool cppISteamUGC_STEAMUGC_INTERFACE_VERSION004_SetCloudFileNameFilter(void *linux_side, UGCQueryHandle_t handle, const char * pMatchCloudFileName)
{
    return ((ISteamUGC*)linux_side)->SetCloudFileNameFilter((UGCQueryHandle_t)handle, (const char *)pMatchCloudFileName);
}

bool cppISteamUGC_STEAMUGC_INTERFACE_VERSION004_SetMatchAnyTag(void *linux_side, UGCQueryHandle_t handle, bool bMatchAnyTag)
{
    return ((ISteamUGC*)linux_side)->SetMatchAnyTag((UGCQueryHandle_t)handle, (bool)bMatchAnyTag);
}

bool cppISteamUGC_STEAMUGC_INTERFACE_VERSION004_SetSearchText(void *linux_side, UGCQueryHandle_t handle, const char * pSearchText)
{
    return ((ISteamUGC*)linux_side)->SetSearchText((UGCQueryHandle_t)handle, (const char *)pSearchText);
}

bool cppISteamUGC_STEAMUGC_INTERFACE_VERSION004_SetRankedByTrendDays(void *linux_side, UGCQueryHandle_t handle, uint32 unDays)
{
    return ((ISteamUGC*)linux_side)->SetRankedByTrendDays((UGCQueryHandle_t)handle, (uint32)unDays);
}

SteamAPICall_t cppISteamUGC_STEAMUGC_INTERFACE_VERSION004_RequestUGCDetails(void *linux_side, PublishedFileId_t nPublishedFileID, uint32 unMaxAgeSeconds)
{
    return ((ISteamUGC*)linux_side)->RequestUGCDetails((PublishedFileId_t)nPublishedFileID, (uint32)unMaxAgeSeconds);
}

SteamAPICall_t cppISteamUGC_STEAMUGC_INTERFACE_VERSION004_CreateItem(void *linux_side, AppId_t nConsumerAppId, EWorkshopFileType eFileType)
{
    return ((ISteamUGC*)linux_side)->CreateItem((AppId_t)nConsumerAppId, (EWorkshopFileType)eFileType);
}

UGCUpdateHandle_t cppISteamUGC_STEAMUGC_INTERFACE_VERSION004_StartItemUpdate(void *linux_side, AppId_t nConsumerAppId, PublishedFileId_t nPublishedFileID)
{
    return ((ISteamUGC*)linux_side)->StartItemUpdate((AppId_t)nConsumerAppId, (PublishedFileId_t)nPublishedFileID);
}

bool cppISteamUGC_STEAMUGC_INTERFACE_VERSION004_SetItemTitle(void *linux_side, UGCUpdateHandle_t handle, const char * pchTitle)
{
    return ((ISteamUGC*)linux_side)->SetItemTitle((UGCUpdateHandle_t)handle, (const char *)pchTitle);
}

bool cppISteamUGC_STEAMUGC_INTERFACE_VERSION004_SetItemDescription(void *linux_side, UGCUpdateHandle_t handle, const char * pchDescription)
{
    return ((ISteamUGC*)linux_side)->SetItemDescription((UGCUpdateHandle_t)handle, (const char *)pchDescription);
}

bool cppISteamUGC_STEAMUGC_INTERFACE_VERSION004_SetItemVisibility(void *linux_side, UGCUpdateHandle_t handle, ERemoteStoragePublishedFileVisibility eVisibility)
{
    return ((ISteamUGC*)linux_side)->SetItemVisibility((UGCUpdateHandle_t)handle, (ERemoteStoragePublishedFileVisibility)eVisibility);
}

bool cppISteamUGC_STEAMUGC_INTERFACE_VERSION004_SetItemTags(void *linux_side, UGCUpdateHandle_t updateHandle, const SteamParamStringArray_t * pTags)
{
    return ((ISteamUGC*)linux_side)->SetItemTags((UGCUpdateHandle_t)updateHandle, (const SteamParamStringArray_t *)pTags);
}

bool cppISteamUGC_STEAMUGC_INTERFACE_VERSION004_SetItemContent(void *linux_side, UGCUpdateHandle_t handle, const char * pszContentFolder)
{
    return ((ISteamUGC*)linux_side)->SetItemContent((UGCUpdateHandle_t)handle, (const char *)pszContentFolder);
}

bool cppISteamUGC_STEAMUGC_INTERFACE_VERSION004_SetItemPreview(void *linux_side, UGCUpdateHandle_t handle, const char * pszPreviewFile)
{
    return ((ISteamUGC*)linux_side)->SetItemPreview((UGCUpdateHandle_t)handle, (const char *)pszPreviewFile);
}

SteamAPICall_t cppISteamUGC_STEAMUGC_INTERFACE_VERSION004_SubmitItemUpdate(void *linux_side, UGCUpdateHandle_t handle, const char * pchChangeNote)
{
    return ((ISteamUGC*)linux_side)->SubmitItemUpdate((UGCUpdateHandle_t)handle, (const char *)pchChangeNote);
}

EItemUpdateStatus cppISteamUGC_STEAMUGC_INTERFACE_VERSION004_GetItemUpdateProgress(void *linux_side, UGCUpdateHandle_t handle, uint64 * punBytesProcessed, uint64 * punBytesTotal)
{
    return ((ISteamUGC*)linux_side)->GetItemUpdateProgress((UGCUpdateHandle_t)handle, (uint64 *)punBytesProcessed, (uint64 *)punBytesTotal);
}

SteamAPICall_t cppISteamUGC_STEAMUGC_INTERFACE_VERSION004_SubscribeItem(void *linux_side, PublishedFileId_t nPublishedFileID)
{
    return ((ISteamUGC*)linux_side)->SubscribeItem((PublishedFileId_t)nPublishedFileID);
}

SteamAPICall_t cppISteamUGC_STEAMUGC_INTERFACE_VERSION004_UnsubscribeItem(void *linux_side, PublishedFileId_t nPublishedFileID)
{
    return ((ISteamUGC*)linux_side)->UnsubscribeItem((PublishedFileId_t)nPublishedFileID);
}

uint32 cppISteamUGC_STEAMUGC_INTERFACE_VERSION004_GetNumSubscribedItems(void *linux_side)
{
    return ((ISteamUGC*)linux_side)->GetNumSubscribedItems();
}

uint32 cppISteamUGC_STEAMUGC_INTERFACE_VERSION004_GetSubscribedItems(void *linux_side, PublishedFileId_t * pvecPublishedFileID, uint32 cMaxEntries)
{
    return ((ISteamUGC*)linux_side)->GetSubscribedItems((PublishedFileId_t *)pvecPublishedFileID, (uint32)cMaxEntries);
}

uint32 cppISteamUGC_STEAMUGC_INTERFACE_VERSION004_GetItemState(void *linux_side, PublishedFileId_t nPublishedFileID)
{
    return ((ISteamUGC*)linux_side)->GetItemState((PublishedFileId_t)nPublishedFileID);
}

bool cppISteamUGC_STEAMUGC_INTERFACE_VERSION004_GetItemInstallInfo(void *linux_side, PublishedFileId_t nPublishedFileID, uint64 * punSizeOnDisk, char * pchFolder, uint32 cchFolderSize, uint32 * punTimeStamp)
{
    return ((ISteamUGC*)linux_side)->GetItemInstallInfo((PublishedFileId_t)nPublishedFileID, (uint64 *)punSizeOnDisk, (char *)pchFolder, (uint32)cchFolderSize, (uint32 *)punTimeStamp);
}

bool cppISteamUGC_STEAMUGC_INTERFACE_VERSION004_GetItemDownloadInfo(void *linux_side, PublishedFileId_t nPublishedFileID, uint64 * punBytesDownloaded, uint64 * punBytesTotal)
{
    return ((ISteamUGC*)linux_side)->GetItemDownloadInfo((PublishedFileId_t)nPublishedFileID, (uint64 *)punBytesDownloaded, (uint64 *)punBytesTotal);
}

bool cppISteamUGC_STEAMUGC_INTERFACE_VERSION004_DownloadItem(void *linux_side, PublishedFileId_t nPublishedFileID, bool bHighPriority)
{
    return ((ISteamUGC*)linux_side)->DownloadItem((PublishedFileId_t)nPublishedFileID, (bool)bHighPriority);
}

#ifdef __cplusplus
}
#endif
