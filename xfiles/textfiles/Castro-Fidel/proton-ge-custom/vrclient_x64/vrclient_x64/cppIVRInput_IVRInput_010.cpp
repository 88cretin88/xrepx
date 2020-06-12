#include "vrclient_private.h"
#include "vrclient_defs.h"
#include "openvr_v1.10.30/ivrclientcore.h"
using namespace vr;
extern "C" {
#include "struct_converters.h"
}
#include "cppIVRInput_IVRInput_010.h"
#ifdef __cplusplus
extern "C" {
#endif
vr::EVRInputError cppIVRInput_IVRInput_010_SetActionManifestPath(void *linux_side, const char * pchActionManifestPath)
{
    return ((IVRInput*)linux_side)->SetActionManifestPath((const char *)pchActionManifestPath);
}

vr::EVRInputError cppIVRInput_IVRInput_010_GetActionSetHandle(void *linux_side, const char * pchActionSetName, VRActionSetHandle_t * pHandle)
{
    return ((IVRInput*)linux_side)->GetActionSetHandle((const char *)pchActionSetName, (vr::VRActionSetHandle_t *)pHandle);
}

vr::EVRInputError cppIVRInput_IVRInput_010_GetActionHandle(void *linux_side, const char * pchActionName, VRActionHandle_t * pHandle)
{
    return ((IVRInput*)linux_side)->GetActionHandle((const char *)pchActionName, (vr::VRActionHandle_t *)pHandle);
}

vr::EVRInputError cppIVRInput_IVRInput_010_GetInputSourceHandle(void *linux_side, const char * pchInputSourcePath, VRInputValueHandle_t * pHandle)
{
    return ((IVRInput*)linux_side)->GetInputSourceHandle((const char *)pchInputSourcePath, (vr::VRInputValueHandle_t *)pHandle);
}

vr::EVRInputError cppIVRInput_IVRInput_010_UpdateActionState(void *linux_side, VRActiveActionSet_t * pSets, uint32_t unSizeOfVRSelectedActionSet_t, uint32_t unSetCount)
{
    return ((IVRInput*)linux_side)->UpdateActionState((vr::VRActiveActionSet_t *)pSets, (uint32_t)unSizeOfVRSelectedActionSet_t, (uint32_t)unSetCount);
}

vr::EVRInputError cppIVRInput_IVRInput_010_GetDigitalActionData(void *linux_side, VRActionHandle_t action, winInputDigitalActionData_t_11030 * pActionData, uint32_t unActionDataSize, VRInputValueHandle_t ulRestrictToDevice)
{
    InputDigitalActionData_t lin;
    vr::EVRInputError _ret;
    if(pActionData)
        struct_InputDigitalActionData_t_11030_win_to_lin(pActionData, &lin);
    _ret = ((IVRInput*)linux_side)->GetDigitalActionData((vr::VRActionHandle_t)action, pActionData ? &lin : nullptr, unActionDataSize ? sizeof(lin) : 0, (vr::VRInputValueHandle_t)ulRestrictToDevice);
    if(pActionData)
        struct_InputDigitalActionData_t_11030_lin_to_win(&lin, pActionData, unActionDataSize);
    return _ret;
}

vr::EVRInputError cppIVRInput_IVRInput_010_GetAnalogActionData(void *linux_side, VRActionHandle_t action, winInputAnalogActionData_t_11030 * pActionData, uint32_t unActionDataSize, VRInputValueHandle_t ulRestrictToDevice)
{
    InputAnalogActionData_t lin;
    vr::EVRInputError _ret;
    if(pActionData)
        struct_InputAnalogActionData_t_11030_win_to_lin(pActionData, &lin);
    _ret = ((IVRInput*)linux_side)->GetAnalogActionData((vr::VRActionHandle_t)action, pActionData ? &lin : nullptr, unActionDataSize ? sizeof(lin) : 0, (vr::VRInputValueHandle_t)ulRestrictToDevice);
    if(pActionData)
        struct_InputAnalogActionData_t_11030_lin_to_win(&lin, pActionData, unActionDataSize);
    return _ret;
}

vr::EVRInputError cppIVRInput_IVRInput_010_GetPoseActionDataRelativeToNow(void *linux_side, VRActionHandle_t action, ETrackingUniverseOrigin eOrigin, float fPredictedSecondsFromNow, winInputPoseActionData_t_11030 * pActionData, uint32_t unActionDataSize, VRInputValueHandle_t ulRestrictToDevice)
{
    InputPoseActionData_t lin;
    vr::EVRInputError _ret;
    if(pActionData)
        struct_InputPoseActionData_t_11030_win_to_lin(pActionData, &lin);
    _ret = ((IVRInput*)linux_side)->GetPoseActionDataRelativeToNow((vr::VRActionHandle_t)action, (vr::ETrackingUniverseOrigin)eOrigin, (float)fPredictedSecondsFromNow, pActionData ? &lin : nullptr, unActionDataSize ? sizeof(lin) : 0, (vr::VRInputValueHandle_t)ulRestrictToDevice);
    if(pActionData)
        struct_InputPoseActionData_t_11030_lin_to_win(&lin, pActionData, unActionDataSize);
    return _ret;
}

vr::EVRInputError cppIVRInput_IVRInput_010_GetPoseActionDataForNextFrame(void *linux_side, VRActionHandle_t action, ETrackingUniverseOrigin eOrigin, winInputPoseActionData_t_11030 * pActionData, uint32_t unActionDataSize, VRInputValueHandle_t ulRestrictToDevice)
{
    InputPoseActionData_t lin;
    vr::EVRInputError _ret;
    if(pActionData)
        struct_InputPoseActionData_t_11030_win_to_lin(pActionData, &lin);
    _ret = ((IVRInput*)linux_side)->GetPoseActionDataForNextFrame((vr::VRActionHandle_t)action, (vr::ETrackingUniverseOrigin)eOrigin, pActionData ? &lin : nullptr, unActionDataSize ? sizeof(lin) : 0, (vr::VRInputValueHandle_t)ulRestrictToDevice);
    if(pActionData)
        struct_InputPoseActionData_t_11030_lin_to_win(&lin, pActionData, unActionDataSize);
    return _ret;
}

vr::EVRInputError cppIVRInput_IVRInput_010_GetSkeletalActionData(void *linux_side, VRActionHandle_t action, winInputSkeletalActionData_t_11030 * pActionData, uint32_t unActionDataSize)
{
    InputSkeletalActionData_t lin;
    vr::EVRInputError _ret;
    if(pActionData)
        struct_InputSkeletalActionData_t_11030_win_to_lin(pActionData, &lin);
    _ret = ((IVRInput*)linux_side)->GetSkeletalActionData((vr::VRActionHandle_t)action, pActionData ? &lin : nullptr, unActionDataSize ? sizeof(lin) : 0);
    if(pActionData)
        struct_InputSkeletalActionData_t_11030_lin_to_win(&lin, pActionData, unActionDataSize);
    return _ret;
}

vr::EVRInputError cppIVRInput_IVRInput_010_GetDominantHand(void *linux_side, ETrackedControllerRole * peDominantHand)
{
    return ((IVRInput*)linux_side)->GetDominantHand((vr::ETrackedControllerRole *)peDominantHand);
}

vr::EVRInputError cppIVRInput_IVRInput_010_SetDominantHand(void *linux_side, ETrackedControllerRole eDominantHand)
{
    return ((IVRInput*)linux_side)->SetDominantHand((vr::ETrackedControllerRole)eDominantHand);
}

vr::EVRInputError cppIVRInput_IVRInput_010_GetBoneCount(void *linux_side, VRActionHandle_t action, uint32_t * pBoneCount)
{
    return ((IVRInput*)linux_side)->GetBoneCount((vr::VRActionHandle_t)action, (uint32_t *)pBoneCount);
}

vr::EVRInputError cppIVRInput_IVRInput_010_GetBoneHierarchy(void *linux_side, VRActionHandle_t action, BoneIndex_t * pParentIndices, uint32_t unIndexArayCount)
{
    return ((IVRInput*)linux_side)->GetBoneHierarchy((vr::VRActionHandle_t)action, (vr::BoneIndex_t *)pParentIndices, (uint32_t)unIndexArayCount);
}

vr::EVRInputError cppIVRInput_IVRInput_010_GetBoneName(void *linux_side, VRActionHandle_t action, BoneIndex_t nBoneIndex, char * pchBoneName, uint32_t unNameBufferSize)
{
    return ((IVRInput*)linux_side)->GetBoneName((vr::VRActionHandle_t)action, (vr::BoneIndex_t)nBoneIndex, (char *)pchBoneName, (uint32_t)unNameBufferSize);
}

vr::EVRInputError cppIVRInput_IVRInput_010_GetSkeletalReferenceTransforms(void *linux_side, VRActionHandle_t action, EVRSkeletalTransformSpace eTransformSpace, EVRSkeletalReferencePose eReferencePose, VRBoneTransform_t * pTransformArray, uint32_t unTransformArrayCount)
{
    return ((IVRInput*)linux_side)->GetSkeletalReferenceTransforms((vr::VRActionHandle_t)action, (vr::EVRSkeletalTransformSpace)eTransformSpace, (vr::EVRSkeletalReferencePose)eReferencePose, (vr::VRBoneTransform_t *)pTransformArray, (uint32_t)unTransformArrayCount);
}

vr::EVRInputError cppIVRInput_IVRInput_010_GetSkeletalTrackingLevel(void *linux_side, VRActionHandle_t action, EVRSkeletalTrackingLevel * pSkeletalTrackingLevel)
{
    return ((IVRInput*)linux_side)->GetSkeletalTrackingLevel((vr::VRActionHandle_t)action, (vr::EVRSkeletalTrackingLevel *)pSkeletalTrackingLevel);
}

vr::EVRInputError cppIVRInput_IVRInput_010_GetSkeletalBoneData(void *linux_side, VRActionHandle_t action, EVRSkeletalTransformSpace eTransformSpace, EVRSkeletalMotionRange eMotionRange, VRBoneTransform_t * pTransformArray, uint32_t unTransformArrayCount)
{
    return ((IVRInput*)linux_side)->GetSkeletalBoneData((vr::VRActionHandle_t)action, (vr::EVRSkeletalTransformSpace)eTransformSpace, (vr::EVRSkeletalMotionRange)eMotionRange, (vr::VRBoneTransform_t *)pTransformArray, (uint32_t)unTransformArrayCount);
}

vr::EVRInputError cppIVRInput_IVRInput_010_GetSkeletalSummaryData(void *linux_side, VRActionHandle_t action, EVRSummaryType eSummaryType, VRSkeletalSummaryData_t * pSkeletalSummaryData)
{
    return ((IVRInput*)linux_side)->GetSkeletalSummaryData((vr::VRActionHandle_t)action, (vr::EVRSummaryType)eSummaryType, (vr::VRSkeletalSummaryData_t *)pSkeletalSummaryData);
}

vr::EVRInputError cppIVRInput_IVRInput_010_GetSkeletalBoneDataCompressed(void *linux_side, VRActionHandle_t action, EVRSkeletalMotionRange eMotionRange, void * pvCompressedData, uint32_t unCompressedSize, uint32_t * punRequiredCompressedSize)
{
    return ((IVRInput*)linux_side)->GetSkeletalBoneDataCompressed((vr::VRActionHandle_t)action, (vr::EVRSkeletalMotionRange)eMotionRange, (void *)pvCompressedData, (uint32_t)unCompressedSize, (uint32_t *)punRequiredCompressedSize);
}

vr::EVRInputError cppIVRInput_IVRInput_010_DecompressSkeletalBoneData(void *linux_side, const void * pvCompressedBuffer, uint32_t unCompressedBufferSize, EVRSkeletalTransformSpace eTransformSpace, VRBoneTransform_t * pTransformArray, uint32_t unTransformArrayCount)
{
    return ((IVRInput*)linux_side)->DecompressSkeletalBoneData((const void *)pvCompressedBuffer, (uint32_t)unCompressedBufferSize, (vr::EVRSkeletalTransformSpace)eTransformSpace, (vr::VRBoneTransform_t *)pTransformArray, (uint32_t)unTransformArrayCount);
}

vr::EVRInputError cppIVRInput_IVRInput_010_TriggerHapticVibrationAction(void *linux_side, VRActionHandle_t action, float fStartSecondsFromNow, float fDurationSeconds, float fFrequency, float fAmplitude, VRInputValueHandle_t ulRestrictToDevice)
{
    return ((IVRInput*)linux_side)->TriggerHapticVibrationAction((vr::VRActionHandle_t)action, (float)fStartSecondsFromNow, (float)fDurationSeconds, (float)fFrequency, (float)fAmplitude, (vr::VRInputValueHandle_t)ulRestrictToDevice);
}

vr::EVRInputError cppIVRInput_IVRInput_010_GetActionOrigins(void *linux_side, VRActionSetHandle_t actionSetHandle, VRActionHandle_t digitalActionHandle, VRInputValueHandle_t * originsOut, uint32_t originOutCount)
{
    return ((IVRInput*)linux_side)->GetActionOrigins((vr::VRActionSetHandle_t)actionSetHandle, (vr::VRActionHandle_t)digitalActionHandle, (vr::VRInputValueHandle_t *)originsOut, (uint32_t)originOutCount);
}

vr::EVRInputError cppIVRInput_IVRInput_010_GetOriginLocalizedName(void *linux_side, VRInputValueHandle_t origin, char * pchNameArray, uint32_t unNameArraySize, int32_t unStringSectionsToInclude)
{
    return ((IVRInput*)linux_side)->GetOriginLocalizedName((vr::VRInputValueHandle_t)origin, (char *)pchNameArray, (uint32_t)unNameArraySize, (int32_t)unStringSectionsToInclude);
}

vr::EVRInputError cppIVRInput_IVRInput_010_GetOriginTrackedDeviceInfo(void *linux_side, VRInputValueHandle_t origin, InputOriginInfo_t * pOriginInfo, uint32_t unOriginInfoSize)
{
    return ((IVRInput*)linux_side)->GetOriginTrackedDeviceInfo((vr::VRInputValueHandle_t)origin, (vr::InputOriginInfo_t *)pOriginInfo, (uint32_t)unOriginInfoSize);
}

vr::EVRInputError cppIVRInput_IVRInput_010_GetActionBindingInfo(void *linux_side, VRActionHandle_t action, InputBindingInfo_t * pOriginInfo, uint32_t unBindingInfoSize, uint32_t unBindingInfoCount, uint32_t * punReturnedBindingInfoCount)
{
    return ((IVRInput*)linux_side)->GetActionBindingInfo((vr::VRActionHandle_t)action, (vr::InputBindingInfo_t *)pOriginInfo, (uint32_t)unBindingInfoSize, (uint32_t)unBindingInfoCount, (uint32_t *)punReturnedBindingInfoCount);
}

vr::EVRInputError cppIVRInput_IVRInput_010_ShowActionOrigins(void *linux_side, VRActionSetHandle_t actionSetHandle, VRActionHandle_t ulActionHandle)
{
    return ((IVRInput*)linux_side)->ShowActionOrigins((vr::VRActionSetHandle_t)actionSetHandle, (vr::VRActionHandle_t)ulActionHandle);
}

vr::EVRInputError cppIVRInput_IVRInput_010_ShowBindingsForActionSet(void *linux_side, VRActiveActionSet_t * pSets, uint32_t unSizeOfVRSelectedActionSet_t, uint32_t unSetCount, VRInputValueHandle_t originToHighlight)
{
    return ((IVRInput*)linux_side)->ShowBindingsForActionSet((vr::VRActiveActionSet_t *)pSets, (uint32_t)unSizeOfVRSelectedActionSet_t, (uint32_t)unSetCount, (vr::VRInputValueHandle_t)originToHighlight);
}

vr::EVRInputError cppIVRInput_IVRInput_010_GetComponentStateForBinding(void *linux_side, const char * pchRenderModelName, const char * pchComponentName, InputBindingInfo_t * pOriginInfo, uint32_t unBindingInfoSize, uint32_t unBindingInfoCount, RenderModel_ComponentState_t * pComponentState)
{
    return ((IVRInput*)linux_side)->GetComponentStateForBinding((const char *)pchRenderModelName, (const char *)pchComponentName, (const vr::InputBindingInfo_t *)pOriginInfo, (uint32_t)unBindingInfoSize, (uint32_t)unBindingInfoCount, (vr::RenderModel_ComponentState_t *)pComponentState);
}

bool cppIVRInput_IVRInput_010_IsUsingLegacyInput(void *linux_side)
{
    return ((IVRInput*)linux_side)->IsUsingLegacyInput();
}

vr::EVRInputError cppIVRInput_IVRInput_010_OpenBindingUI(void *linux_side, const char * pchAppKey, VRActionSetHandle_t ulActionSetHandle, VRInputValueHandle_t ulDeviceHandle, bool bShowOnDesktop)
{
    return ((IVRInput*)linux_side)->OpenBindingUI((const char *)pchAppKey, (vr::VRActionSetHandle_t)ulActionSetHandle, (vr::VRInputValueHandle_t)ulDeviceHandle, (bool)bShowOnDesktop);
}

vr::EVRInputError cppIVRInput_IVRInput_010_GetBindingVariant(void *linux_side, VRInputValueHandle_t ulDevicePath, char * pchVariantArray, uint32_t unVariantArraySize)
{
    return ((IVRInput*)linux_side)->GetBindingVariant((vr::VRInputValueHandle_t)ulDevicePath, (char *)pchVariantArray, (uint32_t)unVariantArraySize);
}

#ifdef __cplusplus
}
#endif
