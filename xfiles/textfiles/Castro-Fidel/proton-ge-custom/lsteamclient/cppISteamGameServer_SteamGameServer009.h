extern void cppISteamGameServer_SteamGameServer009_LogOn(void *);
extern void cppISteamGameServer_SteamGameServer009_LogOff(void *);
extern bool cppISteamGameServer_SteamGameServer009_BLoggedOn(void *);
extern bool cppISteamGameServer_SteamGameServer009_BSecure(void *);
extern CSteamID cppISteamGameServer_SteamGameServer009_GetSteamID(void *);
extern bool cppISteamGameServer_SteamGameServer009_SendUserConnectAndAuthenticate(void *, uint32, const void *, uint32, CSteamID *);
extern CSteamID cppISteamGameServer_SteamGameServer009_CreateUnauthenticatedUserConnection(void *);
extern void cppISteamGameServer_SteamGameServer009_SendUserDisconnect(void *, CSteamID);
extern bool cppISteamGameServer_SteamGameServer009_BUpdateUserData(void *, CSteamID, const char *, uint32);
extern bool cppISteamGameServer_SteamGameServer009_BSetServerType(void *, uint32, uint32, uint16, uint16, uint16, const char *, const char *, bool);
extern void cppISteamGameServer_SteamGameServer009_UpdateServerStatus(void *, int, int, int, const char *, const char *, const char *);
extern void cppISteamGameServer_SteamGameServer009_UpdateSpectatorPort(void *, uint16);
extern void cppISteamGameServer_SteamGameServer009_SetGameType(void *, const char *);
extern bool cppISteamGameServer_SteamGameServer009_BGetUserAchievementStatus(void *, CSteamID, const char *);
extern void cppISteamGameServer_SteamGameServer009_GetGameplayStats(void *);
extern bool cppISteamGameServer_SteamGameServer009_RequestUserGroupStatus(void *, CSteamID, CSteamID);
extern uint32 cppISteamGameServer_SteamGameServer009_GetPublicIP(void *);
extern void cppISteamGameServer_SteamGameServer009_SetGameData(void *, const char *);
extern EUserHasLicenseForAppResult cppISteamGameServer_SteamGameServer009_UserHasLicenseForApp(void *, CSteamID, AppId_t);
