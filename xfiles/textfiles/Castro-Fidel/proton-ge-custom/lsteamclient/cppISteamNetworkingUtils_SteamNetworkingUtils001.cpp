#include "steam_defs.h"
#pragma push_macro("__cdecl")
#undef __cdecl
#include "steamworks_sdk_144/steam_api.h"
#include "steamworks_sdk_144/steamnetworkingtypes.h"
#include "steamworks_sdk_144/isteamnetworkingutils.h"
#pragma pop_macro("__cdecl")
#include "steamclient_private.h"
#ifdef __cplusplus
extern "C" {
#endif
#define SDKVER_144
#include "struct_converters.h"
#include "cppISteamNetworkingUtils_SteamNetworkingUtils001.h"
float cppISteamNetworkingUtils_SteamNetworkingUtils001_GetLocalPingLocation(void *linux_side, SteamNetworkPingLocation_t * result)
{
    return ((ISteamNetworkingUtils*)linux_side)->GetLocalPingLocation((SteamNetworkPingLocation_t *)result);
}

int cppISteamNetworkingUtils_SteamNetworkingUtils001_EstimatePingTimeBetweenTwoLocations(void *linux_side, const SteamNetworkPingLocation_t * location1, const SteamNetworkPingLocation_t * location2)
{
    return ((ISteamNetworkingUtils*)linux_side)->EstimatePingTimeBetweenTwoLocations((const SteamNetworkPingLocation_t *)location1, (const SteamNetworkPingLocation_t *)location2);
}

int cppISteamNetworkingUtils_SteamNetworkingUtils001_EstimatePingTimeFromLocalHost(void *linux_side, const SteamNetworkPingLocation_t * remoteLocation)
{
    return ((ISteamNetworkingUtils*)linux_side)->EstimatePingTimeFromLocalHost((const SteamNetworkPingLocation_t *)remoteLocation);
}

void cppISteamNetworkingUtils_SteamNetworkingUtils001_ConvertPingLocationToString(void *linux_side, const SteamNetworkPingLocation_t * location, char * pszBuf, int cchBufSize)
{
    ((ISteamNetworkingUtils*)linux_side)->ConvertPingLocationToString((const SteamNetworkPingLocation_t *)location, (char *)pszBuf, (int)cchBufSize);
}

bool cppISteamNetworkingUtils_SteamNetworkingUtils001_ParsePingLocationString(void *linux_side, const char * pszString, SteamNetworkPingLocation_t * result)
{
    return ((ISteamNetworkingUtils*)linux_side)->ParsePingLocationString((const char *)pszString, (SteamNetworkPingLocation_t *)result);
}

bool cppISteamNetworkingUtils_SteamNetworkingUtils001_CheckPingDataUpToDate(void *linux_side, float flMaxAgeSeconds)
{
    return ((ISteamNetworkingUtils*)linux_side)->CheckPingDataUpToDate((float)flMaxAgeSeconds);
}

bool cppISteamNetworkingUtils_SteamNetworkingUtils001_IsPingMeasurementInProgress(void *linux_side)
{
    return ((ISteamNetworkingUtils*)linux_side)->IsPingMeasurementInProgress();
}

int cppISteamNetworkingUtils_SteamNetworkingUtils001_GetPingToDataCenter(void *linux_side, SteamNetworkingPOPID popID, SteamNetworkingPOPID * pViaRelayPoP)
{
    return ((ISteamNetworkingUtils*)linux_side)->GetPingToDataCenter((SteamNetworkingPOPID)popID, (SteamNetworkingPOPID *)pViaRelayPoP);
}

int cppISteamNetworkingUtils_SteamNetworkingUtils001_GetDirectPingToPOP(void *linux_side, SteamNetworkingPOPID popID)
{
    return ((ISteamNetworkingUtils*)linux_side)->GetDirectPingToPOP((SteamNetworkingPOPID)popID);
}

int cppISteamNetworkingUtils_SteamNetworkingUtils001_GetPOPCount(void *linux_side)
{
    return ((ISteamNetworkingUtils*)linux_side)->GetPOPCount();
}

int cppISteamNetworkingUtils_SteamNetworkingUtils001_GetPOPList(void *linux_side, SteamNetworkingPOPID * list, int nListSz)
{
    return ((ISteamNetworkingUtils*)linux_side)->GetPOPList((SteamNetworkingPOPID *)list, (int)nListSz);
}

SteamNetworkingMicroseconds cppISteamNetworkingUtils_SteamNetworkingUtils001_GetLocalTimestamp(void *linux_side)
{
    return ((ISteamNetworkingUtils*)linux_side)->GetLocalTimestamp();
}

void cppISteamNetworkingUtils_SteamNetworkingUtils001_SetDebugOutputFunction(void *linux_side, ESteamNetworkingSocketsDebugOutputType eDetailLevel, FSteamNetworkingSocketsDebugOutput pfnFunc)
{
    pfnFunc = (FSteamNetworkingSocketsDebugOutput)manual_convert_FSteamNetworkingSocketsDebugOutput((void*)pfnFunc);
    ((ISteamNetworkingUtils*)linux_side)->SetDebugOutputFunction((ESteamNetworkingSocketsDebugOutputType)eDetailLevel, (FSteamNetworkingSocketsDebugOutput)pfnFunc);
}

bool cppISteamNetworkingUtils_SteamNetworkingUtils001_SetConfigValue(void *linux_side, ESteamNetworkingConfigValue eValue, ESteamNetworkingConfigScope eScopeType, intptr_t scopeObj, ESteamNetworkingConfigDataType eDataType, const void * pArg)
{
    return ((ISteamNetworkingUtils*)linux_side)->SetConfigValue((ESteamNetworkingConfigValue)eValue, (ESteamNetworkingConfigScope)eScopeType, (intptr_t)scopeObj, (ESteamNetworkingConfigDataType)eDataType, (const void *)pArg);
}

ESteamNetworkingGetConfigValueResult cppISteamNetworkingUtils_SteamNetworkingUtils001_GetConfigValue(void *linux_side, ESteamNetworkingConfigValue eValue, ESteamNetworkingConfigScope eScopeType, intptr_t scopeObj, ESteamNetworkingConfigDataType * pOutDataType, void * pResult, size_t * cbResult)
{
    return ((ISteamNetworkingUtils*)linux_side)->GetConfigValue((ESteamNetworkingConfigValue)eValue, (ESteamNetworkingConfigScope)eScopeType, (intptr_t)scopeObj, (ESteamNetworkingConfigDataType *)pOutDataType, (void *)pResult, (size_t *)cbResult);
}

bool cppISteamNetworkingUtils_SteamNetworkingUtils001_GetConfigValueInfo(void *linux_side, ESteamNetworkingConfigValue eValue, const char ** pOutName, ESteamNetworkingConfigDataType * pOutDataType, ESteamNetworkingConfigScope * pOutScope, ESteamNetworkingConfigValue * pOutNextValue)
{
    return ((ISteamNetworkingUtils*)linux_side)->GetConfigValueInfo((ESteamNetworkingConfigValue)eValue, (const char **)pOutName, (ESteamNetworkingConfigDataType *)pOutDataType, (ESteamNetworkingConfigScope *)pOutScope, (ESteamNetworkingConfigValue *)pOutNextValue);
}

ESteamNetworkingConfigValue cppISteamNetworkingUtils_SteamNetworkingUtils001_GetFirstConfigValue(void *linux_side)
{
    return ((ISteamNetworkingUtils*)linux_side)->GetFirstConfigValue();
}

void cppISteamNetworkingUtils_SteamNetworkingUtils001_SteamNetworkingIPAddr_ToString(void *linux_side, const SteamNetworkingIPAddr * addr, char * buf, size_t cbBuf, bool bWithPort)
{
    ((ISteamNetworkingUtils*)linux_side)->SteamNetworkingIPAddr_ToString((const SteamNetworkingIPAddr *)addr, (char *)buf, (size_t)cbBuf, (bool)bWithPort);
}

bool cppISteamNetworkingUtils_SteamNetworkingUtils001_SteamNetworkingIPAddr_ParseString(void *linux_side, SteamNetworkingIPAddr * pAddr, const char * pszStr)
{
    return ((ISteamNetworkingUtils*)linux_side)->SteamNetworkingIPAddr_ParseString((SteamNetworkingIPAddr *)pAddr, (const char *)pszStr);
}

void cppISteamNetworkingUtils_SteamNetworkingUtils001_SteamNetworkingIdentity_ToString(void *linux_side, const SteamNetworkingIdentity * identity, char * buf, size_t cbBuf)
{
    ((ISteamNetworkingUtils*)linux_side)->SteamNetworkingIdentity_ToString((const SteamNetworkingIdentity *)identity, (char *)buf, (size_t)cbBuf);
}

bool cppISteamNetworkingUtils_SteamNetworkingUtils001_SteamNetworkingIdentity_ParseString(void *linux_side, SteamNetworkingIdentity * pIdentity, const char * pszStr)
{
    return ((ISteamNetworkingUtils*)linux_side)->SteamNetworkingIdentity_ParseString((SteamNetworkingIdentity *)pIdentity, (const char *)pszStr);
}

#ifdef __cplusplus
}
#endif
