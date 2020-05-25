extern HSteamListenSocket cppISteamNetworkingSockets_SteamNetworkingSockets003_CreateListenSocketIP(void *, const SteamNetworkingIPAddr *);
extern HSteamNetConnection cppISteamNetworkingSockets_SteamNetworkingSockets003_ConnectByIPAddress(void *, const SteamNetworkingIPAddr *);
extern HSteamListenSocket cppISteamNetworkingSockets_SteamNetworkingSockets003_CreateListenSocketP2P(void *, int);
extern HSteamNetConnection cppISteamNetworkingSockets_SteamNetworkingSockets003_ConnectP2P(void *, const SteamNetworkingIdentity *, int);
extern EResult cppISteamNetworkingSockets_SteamNetworkingSockets003_AcceptConnection(void *, HSteamNetConnection);
extern bool cppISteamNetworkingSockets_SteamNetworkingSockets003_CloseConnection(void *, HSteamNetConnection, int, const char *, bool);
extern bool cppISteamNetworkingSockets_SteamNetworkingSockets003_CloseListenSocket(void *, HSteamListenSocket);
extern bool cppISteamNetworkingSockets_SteamNetworkingSockets003_SetConnectionUserData(void *, HSteamNetConnection, int64);
extern int64 cppISteamNetworkingSockets_SteamNetworkingSockets003_GetConnectionUserData(void *, HSteamNetConnection);
extern void cppISteamNetworkingSockets_SteamNetworkingSockets003_SetConnectionName(void *, HSteamNetConnection, const char *);
extern bool cppISteamNetworkingSockets_SteamNetworkingSockets003_GetConnectionName(void *, HSteamNetConnection, char *, int);
extern EResult cppISteamNetworkingSockets_SteamNetworkingSockets003_SendMessageToConnection(void *, HSteamNetConnection, const void *, uint32, int);
extern EResult cppISteamNetworkingSockets_SteamNetworkingSockets003_FlushMessagesOnConnection(void *, HSteamNetConnection);
extern int cppISteamNetworkingSockets_SteamNetworkingSockets003_ReceiveMessagesOnConnection(void *, HSteamNetConnection, winSteamNetworkingMessage_t_146 **, int);
extern int cppISteamNetworkingSockets_SteamNetworkingSockets003_ReceiveMessagesOnListenSocket(void *, HSteamListenSocket, winSteamNetworkingMessage_t_146 **, int);
extern bool cppISteamNetworkingSockets_SteamNetworkingSockets003_GetConnectionInfo(void *, HSteamNetConnection, SteamNetConnectionInfo_t *);
extern bool cppISteamNetworkingSockets_SteamNetworkingSockets003_GetQuickConnectionStatus(void *, HSteamNetConnection, SteamNetworkingQuickConnectionStatus *);
extern int cppISteamNetworkingSockets_SteamNetworkingSockets003_GetDetailedConnectionStatus(void *, HSteamNetConnection, char *, int);
extern bool cppISteamNetworkingSockets_SteamNetworkingSockets003_GetListenSocketAddress(void *, HSteamListenSocket, SteamNetworkingIPAddr *);
extern bool cppISteamNetworkingSockets_SteamNetworkingSockets003_CreateSocketPair(void *, HSteamNetConnection *, HSteamNetConnection *, bool, const SteamNetworkingIdentity *, const SteamNetworkingIdentity *);
extern bool cppISteamNetworkingSockets_SteamNetworkingSockets003_GetIdentity(void *, SteamNetworkingIdentity *);
extern ESteamNetworkingAvailability cppISteamNetworkingSockets_SteamNetworkingSockets003_InitAuthentication(void *);
extern ESteamNetworkingAvailability cppISteamNetworkingSockets_SteamNetworkingSockets003_GetAuthenticationStatus(void *, SteamNetAuthenticationStatus_t *);
extern bool cppISteamNetworkingSockets_SteamNetworkingSockets003_ReceivedRelayAuthTicket(void *, const void *, int, SteamDatagramRelayAuthTicket *);
extern int cppISteamNetworkingSockets_SteamNetworkingSockets003_FindRelayAuthTicketForServer(void *, const SteamNetworkingIdentity *, int, SteamDatagramRelayAuthTicket *);
extern HSteamNetConnection cppISteamNetworkingSockets_SteamNetworkingSockets003_ConnectToHostedDedicatedServer(void *, const SteamNetworkingIdentity *, int);
extern uint16 cppISteamNetworkingSockets_SteamNetworkingSockets003_GetHostedDedicatedServerPort(void *);
extern SteamNetworkingPOPID cppISteamNetworkingSockets_SteamNetworkingSockets003_GetHostedDedicatedServerPOPID(void *);
extern EResult cppISteamNetworkingSockets_SteamNetworkingSockets003_GetHostedDedicatedServerAddress(void *, SteamDatagramHostedAddress *);
extern HSteamListenSocket cppISteamNetworkingSockets_SteamNetworkingSockets003_CreateHostedDedicatedServerListenSocket(void *, int);
extern EResult cppISteamNetworkingSockets_SteamNetworkingSockets003_GetGameCoordinatorServerLogin(void *, SteamDatagramGameCoordinatorServerLogin *, int *, void *);
